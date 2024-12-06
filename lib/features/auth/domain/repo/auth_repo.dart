import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entity/user_entity.dart';

abstract class AuthRepo {
  //here we create the AuthRepo contract, making it general so we can use it with any authentication service
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);
  Future addUserData({required UserEntity user});
  Future<UserEntity> getUserData(
      {required String
          userId}); //here we define the getUserData method to get the user data from the firestore or any service
  Future saveUserData(
      {required UserEntity user}); //abstract method for saving user datta
}
