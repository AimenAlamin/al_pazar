import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entity/user_entity.dart';

abstract class AuthRepo {
  //here we create the AuthRepo contract, making it general so we can use it with any authentication service
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);
}
