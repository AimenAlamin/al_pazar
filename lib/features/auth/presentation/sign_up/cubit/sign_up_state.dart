part of 'sign_up_cubit.dart';

sealed class SignUpEmailState {}

final class SignUpEmailInitial extends SignUpEmailState {}

final class SignUpEmailLoading extends SignUpEmailState {}

final class SignUpEmailSuccess extends SignUpEmailState {
  final UserEntity
      userEntity; //if the user is created successfully we return the userEntity
  SignUpEmailSuccess({required this.userEntity});
}

final class SignUpEmailFailure extends SignUpEmailState {
  final String message;
  SignUpEmailFailure({required this.message});
}
