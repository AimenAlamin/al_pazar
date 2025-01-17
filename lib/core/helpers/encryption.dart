import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:pointycastle/export.dart' as pc;

class CryptoJSHelper {
  static const String passphrase = 'Kibzar';
  static final Random _random = Random.secure();

  static String encryptToBase64(String plaintext) {
    // 1) Generate 8-byte salt
    final salt = Uint8List.fromList(
      List<int>.generate(8, (_) => _random.nextInt(256)),
    );

    // 2) Derive key + IV via PBKDF2
    final derived = _deriveKeyAndIV(passphrase, salt, 1000, 32, 16);
    final keyBytes = derived.sublist(0, 32);
    final ivBytes = derived.sublist(32, 48);

    // 3) AES-256-CBC with default PKCS7 (no explicit “padding:” argument)
    final aes = encrypt.Encrypter(
      encrypt.AES(
        encrypt.Key(keyBytes),
        mode: encrypt.AESMode.cbc,
        // No "padding" argument => default is PKCS7
      ),
    );
    final iv = encrypt.IV(ivBytes);

    // 4) Encrypt plaintext
    final encrypted = aes.encrypt(plaintext, iv: iv);

    // 5) Build "Salted__" + salt + ciphertext
    final salted = <int>[];
    salted.addAll(utf8.encode('Salted__'));
    salted.addAll(salt);
    salted.addAll(encrypted.bytes);

    // 6) Return Base64
    return base64.encode(salted);
  }

  static String decryptFromBase64(String base64Ciphertext) {
    final cipherData = base64.decode(base64Ciphertext);

    // Must start with "Salted__"
    final saltedPrefix = utf8.decode(cipherData.sublist(0, 8));
    if (saltedPrefix != 'Salted__') {
      throw ArgumentError('Invalid ciphertext: missing "Salted__"');
    }

    // Next 8 bytes = salt
    final salt = cipherData.sublist(8, 16);

    // Remaining bytes = actual ciphertext
    final encryptedBytes = cipherData.sublist(16);

    // Derive key & IV
    final derived =
        _deriveKeyAndIV(passphrase, Uint8List.fromList(salt), 1000, 32, 16);
    final keyBytes = derived.sublist(0, 32);
    final ivBytes = derived.sublist(32, 48);

    // AES-256-CBC with default PKCS7
    final aes = encrypt.Encrypter(
      encrypt.AES(
        encrypt.Key(keyBytes),
        mode: encrypt.AESMode.cbc,
      ),
    );
    final iv = encrypt.IV(ivBytes);

    final decrypted = aes.decrypt(
      encrypt.Encrypted(encryptedBytes),
      iv: iv,
    );
    return decrypted;
  }

  static Uint8List _deriveKeyAndIV(
    String passphrase,
    Uint8List salt,
    int iterations,
    int keySize,
    int ivSize,
  ) {
    final passphraseBytes = Uint8List.fromList(utf8.encode(passphrase));
    final totalLength = keySize + ivSize; // 32 + 16 = 48

    final derivator = pc.PBKDF2KeyDerivator(
      pc.HMac(pc.SHA256Digest(), 64),
    )..init(
        pc.Pbkdf2Parameters(salt, iterations, totalLength),
      );

    // Derive a 48-byte array = 32 for key, 16 for IV
    final keyIV = derivator.process(passphraseBytes);
    return keyIV;
  }
}
