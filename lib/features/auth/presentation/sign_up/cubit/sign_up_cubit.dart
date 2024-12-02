import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import '../../../domain/entity/user_entity.dart';
import '../../../domain/repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpEmailCubit extends Cubit<SignUpEmailState> {
  SignUpEmailCubit(this.authRepo) : super(SignUpEmailInitial());
  final AuthRepo authRepo;
  //creating controllers here, so that we can access them easily in the UI and avoid logic in the UI
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //creating the cubit method which is triggered in the UI
  Future<void> signUpWithEmailAndPassword() async {
    emit(SignUpEmailLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
        emailController.text, passwordController.text, nameController.text);
    result.fold(
      (failure) => emit(SignUpEmailFailure(message: failure.message)),
      (userEntity) => emit(SignUpEmailSuccess(userEntity: userEntity)),
    );
  }
}
