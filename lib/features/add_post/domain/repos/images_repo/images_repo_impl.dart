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
  Future<Either<Failure, List<String>>> uploadImages(List<File> images) async {
    try {
      // Upload multiple images and retrieve their URLs
      List<String> urls = await storageService.uploadFiles(
          images,
          BackEndpoint
              .imagesPathName); // Pass the list of images and the folder path name to the storage
      return Right(urls); // Return the list of image URLs
    } catch (e) {
      return Left(
        ServerFailure("Failed to upload images"),
      );
    }
  }
}
