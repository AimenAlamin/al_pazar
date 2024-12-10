import 'dart:io';

import 'package:al_pazar/core/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart'
    as p; //importing path as p which is a package that provides the filename and extension from a path

class FirebaseStorageService implements StoargeService {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile(File file, String referenceFileStoragePath) async {
    String fileName = p.basename(file
        .path); //here we pass the file and the package will get the file path and return the file name
    String extensionName = p.extension(file
        .path); //here we pass the file and the package will get the file path and return the extension
    var fileReference =
        storageRef.child('$referenceFileStoragePath/$fileName.$extensionName');
    await fileReference.putFile(file); //uploading the file to the storage
    var imageUrl = await fileReference
        .getDownloadURL(); //getting the URL of the uploaded file
    return imageUrl;
  }
}
