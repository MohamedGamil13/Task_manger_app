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

// Validation states
final class EmailValidationState extends LoginState {
  final String? emailError;
  final bool isValid;
  EmailValidationState({this.emailError, required this.isValid});
}

final class PasswordValidationState extends LoginState {
  final String? passwordError;
  final bool isValid;
  PasswordValidationState({this.passwordError, required this.isValid});
}

final class FormValidationState extends LoginState {
  final bool isFormValid;
  FormValidationState({required this.isFormValid});
}

// Combined validation state for UI
final class ValidationState extends LoginState {
  final String? emailError;
  final String? passwordError;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isFormValid;
  
  ValidationState({
    this.emailError,
    this.passwordError,
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.isFormValid,
  });
}

// Password reset success state
final class PasswordResetSuccess extends LoginState {}
