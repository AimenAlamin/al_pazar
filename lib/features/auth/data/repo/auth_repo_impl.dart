import 'dart:convert';
import 'dart:developer';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/endpoints.dart';
import '../../../../core/helpers/shared_preferences.dart';
import '../../../../core/services/data_serivce.dart';

import '../../domain/entity/user_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/services/firebase_auth_services.dart';
import '../../domain/repo/auth_repo.dart';
import '../model/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  //here we implement the AuthRepo contract
  final FirebaseAuthService
      firebaseAuthService; //here we inject the firebaseAuthService
  final DatabaseService
      databaseService; //here we inject the general databaseService and use it's method which's implemented in it's concurete class
  AuthRepoImpl(
      {required this.firebaseAuthService, required this.databaseService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      //This method will be used in the cubit to create a user(intercrat with the UI/manage the UI state)
      String email,
      String password,
      String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email,
          password:
              password); //these are not all my user data. They the datas that are going to the method of the serivce
      //after getting the user data from the firebaseAuthService we return it as a UserModel/UserEntity
      var userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
      );
      //here we add the user data to the firestore
      await addUserData(user: userEntity);

      return right(userEntity); //Either<right>
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService
            .deleteUser(); //if the user is created but the data is not added to the firestore because error occured, we delete the user
      }
      return left(
        ServerFailure(e //Either<left>
            .message),
      ); //here we return the ServerFailure with the message from the CustomException
    } catch (e) {
      if (user != null) {
        await firebaseAuthService
            .deleteUser(); //if the user is created but the data is not added to the firestore we delete the user
      }
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
      log('Signed in user: ${user.uid}');
      var userEntity = await getUserData(
          userId: user
              .uid); //getting(retrieving) the data coming from me/user not the firebase authenction
      log('Fetched user data: ${userEntity.toString()}');

      //after getting the new data, Im locally saving it in the shared preferences
      await saveUserData(user: userEntity);
      return right(
          // UserModel.fromFirebaseUser(user),
          userEntity);
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

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
        path: BackEndpoint.setUserEndpoint,
        data: UserModel.fromEntity(user)
            .toMap(), //here we send the user detials as a map becuase firestore data is in maps
        documentId: user.uId);
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async {
    var userData = await databaseService.getData(
        path: BackEndpoint.getUserEndpoint, documentID: userId);
    return UserModel.fromJson(
        userData); //here we convert the data from the firestore to a model
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user)
        .toMap()); //here I convert the user data into user model and then to Map so I can have same dataype as firestore Map<String,dynamic>, then I JsonEncode it all to be string
    log('Saving user data: $jsonData');
    await Prefs.setString(kUserData,
        jsonData); //after encoding done, Im saving it as a string in the shared preferences to save it locally
  }
}
