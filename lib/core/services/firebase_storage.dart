import 'dart:io';

import 'storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

class FirebaseStorageService implements StoargeService {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<List<String>> uploadFiles(
      List<File> files, String referenceFileStoragePath) async {
    List<String> imageUrls = [];

    for (var file in files) {
      // Loop through each file in the list
      String fileName = p.basename(file.path);
      String extensionName = p.extension(file.path);
      var fileReference = storageRef
          .child('$referenceFileStoragePath/$fileName.$extensionName');

      // Uploading each file
      await fileReference.putFile(file);
      var imageUrl = await fileReference.getDownloadURL();
      imageUrls.add(imageUrl); // Add the URL to the list
    }

    return imageUrls; // Return the list of image URLs
  }
}
