import 'dart:io';

import 'package:al_pazar/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ImagesRepo {
  Future<Either<Failure, String>> uploadImage(File image);
}
