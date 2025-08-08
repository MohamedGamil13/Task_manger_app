part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSucess extends LoginState {}

final class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}

final class LoginLoading extends LoginState {}
