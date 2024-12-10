import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import '../../../domain/entity/user_entity.dart';
import '../../../domain/repo/auth_repo.dart';

part 'login_email_state.dart';

class LoginEmailCubit extends Cubit<LoginEmailState> {
  LoginEmailCubit(this.authRepo) : super(LoginEmailInitial());
  final AuthRepo authRepo;
  //creating controllers here, so that we can access them easily in the UI and avoid logic in the UI
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //creating the cubit method which is triggered in the UI
  Future<void> loginWithEmailAndPassword() async {
    emit(LoginEmailLoading());
    final result = await authRepo.signInWithEmailAndPassword(
        emailController.text, passwordController.text);
    result.fold(
      (failure) => emit(LoginEmailFailure(failure.message)),
      (user) => emit(LoginEmailSuccess(user)),
    );
  }
}
