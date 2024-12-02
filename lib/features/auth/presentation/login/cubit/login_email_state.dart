part of 'login_email_cubit.dart';

abstract class LoginEmailState {}

final class LoginEmailInitial extends LoginEmailState {}

final class LoginEmailLoading extends LoginEmailState {}

final class LoginEmailSuccess extends LoginEmailState {
  final UserEntity user;
  LoginEmailSuccess(this.user);
}

final class LoginEmailFailure extends LoginEmailState {
  final String message;
  LoginEmailFailure(this.message);
}
