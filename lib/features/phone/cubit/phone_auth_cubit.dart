// import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:meta/meta.dart';

// part 'phone_auth_state.dart';

// class PhoneAuthCubit extends Cubit<PhoneAuthState> {
//   late String verificationId;

//   PhoneAuthCubit() : super(PhoneAuthInitial());

//   Future<void> submitPhoneNumber(String phoneNumber) async {
//     emit(Loading());

//     // Pass phone number as it is
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: '+90$phoneNumber',
//       timeout: const Duration(seconds: 60),
//       verificationCompleted: verificationCompleted,
//       verificationFailed: verificationFailed,
//       codeSent: codeSent,
//       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
//     );
//   }

//   void verificationCompleted(PhoneAuthCredential credential) async {
//     print('verificationCompleted');
//     await signIn(credential);
//   }

//   void verificationFailed(FirebaseAuthException error) {
//     switch (error.code) {
//       case 'quotaExceeded':
//         emit(ErrorOccurred(
//             errorMsg: 'Verification quota exceeded. Try again later.'));
//         break;
//       case 'invalid-phone-number':
//         emit(ErrorOccurred(
//             errorMsg: 'Invalid phone number. Check the format and try again.'));
//         break;
//       case 'network-request-failed':
//         emit(ErrorOccurred(
//             errorMsg: 'Network error. Please check your connection.'));
//         break;
//       default:
//         emit(ErrorOccurred(errorMsg: 'An error occurred: ${error.message}'));
//         break;
//     }
//   }

//   void codeSent(String verificationId, int? resendToken) {
//     print('codeSent');
//     this.verificationId = verificationId;
//     emit(PhoneNumberSubmited());
//   }

//   void codeAutoRetrievalTimeout(String verificationId) {
//     print('codeAutoRetrievalTimeout');
//   }

//   Future<void> submitOTP(String otpCode) async {
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: this.verificationId, smsCode: otpCode);

//     await signIn(credential);
//   }

//   Future<void> signIn(PhoneAuthCredential credential) async {
//     try {
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       emit(PhoneOTPVerified());
//     } catch (error) {
//       emit(ErrorOccurred(errorMsg: error.toString()));
//     }
//   }

//   Future<void> logOut() async {
//     await FirebaseAuth.instance.signOut();
//   }

//   User getLoggedInUser() {
//     User firebaseUser = FirebaseAuth.instance.currentUser!;
//     return firebaseUser;
//   }
// }
