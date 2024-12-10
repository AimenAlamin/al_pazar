import 'dart:io';

import '../../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ImagesRepo {
  Future<Either<Failure, String>> uploadImage(
      File image); //general method that uploads the file and returns the URL
}
