import 'dart:io';

abstract class StoargeService {
  Future<List<String>> uploadFiles(
      List<File> files,
      String
          referenceFileStoragePath); //general method that uploads a file image  to the storage and return the URL
}
