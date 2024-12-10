import 'dart:io';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/helpers/endpoints.dart';
import '../../../../../core/services/storage_service.dart';
import 'images_repo.dart';
import 'package:dartz/dartz.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StoargeService storageService;

  ImagesRepoImpl(this.storageService);

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await storageService.uploadFile(
          image,
          BackEndpoint
              .imagesPathName); //uploading the image and folderpath name to the storage
      return Right(url);
    } catch (e) {
      return Left(
        ServerFailure("Failed to upload image"),
      );
    }
  }
}
