import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:pointycastle/export.dart' as pc;

/// Matches the default passphrase-based AES in CryptoJS:
///   CryptoJS.AES.encrypt("message", "Kibzar")
/// which is AES-128 (16-byte key) + 16-byte IV, PBKDF2-HMAC-SHA256, 1000 iterations.
class CryptoJSHelper {
  static const String passphrase = 'Kibzar';
  static final Random _random = Random.secure();

  /// Encrypt plaintext -> "U2FsdGVkX1..." ciphertext (AES-128)
  static String encryptToBase64(String plaintext) {
    // 1) Generate random 8-byte salt
    final salt = Uint8List.fromList(
      List<int>.generate(8, (_) => _random.nextInt(256)),
    );

    // 2) Derive 16-byte key + 16-byte IV
    final derived = _deriveKeyAndIV(
      passphrase,
      salt,
      1000, // PBKDF2 iterations
      16, // keySize = 16 bytes (128 bits)
      16, // ivSize = 16 bytes (128 bits block size for AES)
    );

    final keyBytes = derived.sublist(0, 16);
    final ivBytes = derived.sublist(16, 32);

    // 3) AES-128-CBC (default PKCS7 padding)
    final aes = encrypt.Encrypter(
      encrypt.AES(
        encrypt.Key(keyBytes),
        mode: encrypt.AESMode.cbc,
      ),
    );
    final iv = encrypt.IV(ivBytes);

    // 4) Encrypt
    final encrypted = aes.encrypt(plaintext, iv: iv);

    // 5) Combine "Salted__" + salt + ciphertext
    final salted = <int>[];
    salted.addAll(utf8.encode('Salted__')); // 8 bytes
    salted.addAll(salt); // 8 bytes
    salted.addAll(encrypted.bytes); // Encrypted payload

    // 6) Return as Base64
    return base64.encode(salted);
  }

  /// Decrypt a "U2FsdGVkX1..." AES-128 ciphertext
  static String decryptFromBase64(String base64Ciphertext) {
    // 1) Base64 decode
    final cipherData = base64.decode(base64Ciphertext);

    // 2) Must start with "Salted__"
    final saltedPrefix = utf8.decode(cipherData.sublist(0, 8));
    if (saltedPrefix != 'Salted__') {
      throw ArgumentError('Invalid ciphertext: missing "Salted__"');
    }

    // 3) Next 8 bytes = salt
    final salt = cipherData.sublist(8, 16);

    // 4) Remaining = encrypted payload
    final encryptedBytes = cipherData.sublist(16);

    // 5) Derive 16-byte key + 16-byte IV
    final derived = _deriveKeyAndIV(
      passphrase,
      Uint8List.fromList(salt),
      1000, // same iterations
      16, // keySize
      16, // ivSize
    );
    final keyBytes = derived.sublist(0, 16);
    final ivBytes = derived.sublist(16, 32);

    // 6) AES-128-CBC
    final aes = encrypt.Encrypter(
      encrypt.AES(
        encrypt.Key(keyBytes),
        mode: encrypt.AESMode.cbc,
      ),
    );
    final iv = encrypt.IV(ivBytes);

    // 7) Decrypt
    final decrypted = aes.decrypt(
      encrypt.Encrypted(encryptedBytes),
      iv: iv,
    );

    return decrypted;
  }

  /// PBKDF2-HMAC-SHA256 => [keySize + ivSize] bytes
  static Uint8List _deriveKeyAndIV(
    String passphrase,
    Uint8List salt,
    int iterations,
    int keySize,
    int ivSize,
  ) {
    final passphraseBytes = Uint8List.fromList(utf8.encode(passphrase));
    final totalLength = keySize + ivSize; // 16 + 16 = 32

    final derivator = pc.PBKDF2KeyDerivator(
      pc.HMac(pc.SHA256Digest(), 64),
    )..init(
        pc.Pbkdf2Parameters(salt, iterations, totalLength),
      );

    // e.g., 32 bytes total => 16 for key, 16 for IV
    final keyIV = derivator.process(passphraseBytes);
    return keyIV;
  }
}
