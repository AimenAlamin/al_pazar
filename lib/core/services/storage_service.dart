import 'dart:io';

abstract class StoargeService {
  Future<String> uploadFile(
      File file,
      String
          referenceFileStoragePath); //general method that uploads a file image  to the storage and return the URL
}
