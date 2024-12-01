import 'package:bloc/bloc.dart';

import '../../../domain/entity/user_entity.dart';
import '../../../domain/repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpEmailCubit extends Cubit<SignUpEmailState> {
  SignUpEmailCubit(this.authRepo) : super(SignUpEmailInitial());
  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    emit(SignUpEmailLoading());
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
      (failure) => emit(SignUpEmailFailure(message: failure.message)),
      (userEntity) => emit(SignUpEmailSuccess(userEntity: userEntity)),
    );
  }
}
