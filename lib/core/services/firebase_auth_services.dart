import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../errors/exception.dart';

class FirebaseAuthService {
  // This class is responsible for handling all the firebase services/authenction related operations. That's why it's in the core

  Future<User> createUserWithEmailAndPassword(
      //here I used the firebase createUserWithEmailAndPassword method to create a user
      {required String email,
      required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!; //here we return the firebase user
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'The account already exists for that email.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'Please check your internet connection and try again.');
      } else {
        throw CustomException(
            message: 'An error occurred please try again later.');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");

      throw CustomException(
          message: 'An error occurred please try again later.');
    }
  }
}
