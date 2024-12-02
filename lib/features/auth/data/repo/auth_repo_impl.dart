import 'dart:developer';

import 'package:al_pazar/core/errors/exception.dart';
import 'package:al_pazar/core/errors/failure.dart';

import 'package:al_pazar/features/auth/domain/entity/user_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/services/firebase_auth_services.dart';
import '../../domain/repo/auth_repo.dart';
import '../model/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  //here we implement the AuthRepo contract
  final FirebaseAuthService
      firebaseAuthService; //here we inject the firebaseAuthService

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      //This method will be used in the cubit to create a user(intercrat with the UI/manage the UI state)
      String email,
      String password,
      String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email,
          password:
              password); //these are not all my user data. They the datas that are going to the method of the serivce
      //after getting the user data from the firebaseAuthService we return it as a UserModel/UserEntity
      return right(
        UserModel.fromFirebaseUser(user),
      ); //Either<right>
    } on CustomException catch (e) {
      return left(
        ServerFailure(e //Either<left>
            .message),
      ); //here we return the ServerFailure with the message from the CustomException
    } catch (e) {
      log(
        "Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}",
      );
      return left(
        ServerFailure(
            'An error occurred please try again later.'), //Either<left>
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomException catch (e) {
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}");
      return left(
        ServerFailure('An error occurred please try again later.'),
      );
    }
  }
}
