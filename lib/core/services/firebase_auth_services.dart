import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../errors/exception.dart';

//my backend is firebase so I used the firebase_auth package to interact with the firebase services
class FirebaseAuthService {
  // This class is responsible for handling all the firebase services/authenction related operations. That's why it's in the core
  //SIGN UP
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
      final usercredential = credential.user!;
      await usercredential.sendEmailVerification();
      return usercredential; //here we return the firebase user
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'Account with this email already registered.');
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

  //Delete User if sign up fails or if the user wants to delete his account
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  //SIGN IN
  Future<User> signInWithEmailAndPassword(
      //here I used the firebase signInWithEmailAndPassword method to sign in a user
      {required String email,
      required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final usercredential = credential.user!;
      // Check if email is verified
      if (!usercredential.emailVerified) {
        await FirebaseAuth.instance.signOut();
        throw CustomException(
          message: 'Please verify your email before logging in.',
        );
      }

      return usercredential; // Return the Firebase user if email is verified. //here we return the firebase user
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'User not found, sign up first.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'User not found, sign up first.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
            message: 'Email or password is wrong, please try again.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'Wrong password, please try again.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'Please check your internet connection and try again.');
      } else {
        throw CustomException(
            message: 'An error occurred please try again later.');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}");

      throw CustomException(
          message: 'An error occurred please try again later.');
    }
  }

  //Check if user is logged in, and based on this condition, we can show different screens to the user
  bool isUserLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  //SIGN OUT invalid-credential
  // Future<void> signOut() async {
  //   try {
  //     await FirebaseAuth.instance.signOut();
  //   } catch (e) {
  //     log("Exception in FirebaseAuthService.signOut: ${e.toString()}");

  //     throw CustomException(
  //         message: 'An error occurred please try again later.');
  //   }
  // }
  //SIGN UP PHONE
  // Future<User> signInWithPhoneNumber(
  //     //here I used the firebase signInWithPhoneNumber method to sign in a user with phone number
  //     {required String phoneNumber,
  //     required String verificationId,
  //     required String smsCode}) async {
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithPhoneNumber(
  //       verificationId: verificationId,
  //       smsCode: smsCode,
  //     );
  //     return credential.user!; //here we return the firebase user
  //   } on FirebaseAuthException catch (e) {
  //     log("Exception in FirebaseAuthService.signInWithPhoneNumber: ${e.toString()} and code is ${e.code}");
  //     if (e.code == 'invalid-verification-code') {
  //       throw CustomException(message: 'Invalid verification code.');
  //     } else if (e.code == 'invalid-verification-id') {
  //       throw CustomException(message: 'Invalid verification id.');
  //     } else if (e.code == 'network-request-failed') {
  //       throw CustomException(
  //           message: 'Please check your internet connection and try again.');
  //     } else {
  //       throw CustomException(
  //           message: 'An error occurred please try again later.');
  //     }
  //   } catch (e) {
  //     log("Exception in FirebaseAuthService.signInWithPhoneNumber: ${e.toString()}");

  //     throw CustomException(
  //         message: 'An error occurred please try again later.');
  //   }
  // }
}
