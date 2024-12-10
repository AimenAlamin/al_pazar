import 'dart:io';

import 'package:al_pazar/core/errors/failure.dart';
import 'package:al_pazar/core/helpers/endpoints.dart';
import 'package:al_pazar/core/services/storage_service.dart';
import 'package:al_pazar/features/add_post/presenation/view/domain/repos/images_repo/images_repo.dart';
import 'package:dartz/dartz.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StoargeService storageService;

  ImagesRepoImpl({required this.storageService});
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
