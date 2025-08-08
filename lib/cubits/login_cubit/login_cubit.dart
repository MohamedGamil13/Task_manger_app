import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // Track current validation state
  String? _emailError;
  String? _passwordError;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  // Validation methods
  void validateEmail(String email) {
    if (email.isEmpty) {
      _emailError = 'Email is required';
      _isEmailValid = false;
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      _emailError = 'Please enter a valid email address';
      _isEmailValid = false;
    } else {
      _emailError = null;
      _isEmailValid = true;
    }
    _emitValidationState();
  }

  void validatePassword(String password) {
    if (password.isEmpty) {
      _passwordError = 'Password is required';
      _isPasswordValid = false;
    } else if (password.length < 6) {
      _passwordError = 'Password must be at least 6 characters';
      _isPasswordValid = false;
    } else {
      _passwordError = null;
      _isPasswordValid = true;
    }
    _emitValidationState();
  }

  void validateForm(String email, String password) {
    validateEmail(email);
    validatePassword(password);
  }

  void _emitValidationState() {
    emit(
      ValidationState(
        emailError: _emailError,
        passwordError: _passwordError,
        isEmailValid: _isEmailValid,
        isPasswordValid: _isPasswordValid,
        isFormValid: _isEmailValid && _isPasswordValid,
      ),
    );
  }

  void signUp({required String emailAddress, required String password}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      emit(LoginSucess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(LoginFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(LoginFailure('The account already exists for that email.'));
      }
    } catch (e) {
      print(e);
      emit(LoginFailure(e.toString()));
    }
  }

  void signIN({required String emailAddress, required String password}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      emit(LoginSucess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure('Wrong password provided for that user.'));
      }
    }
  }

  Future<void> resetPassword({required String emailAddress}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
      emit(PasswordResetSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure('No user found for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(LoginFailure('Please enter a valid email address.'));
      } else {
        emit(LoginFailure(e.message ?? 'Failed to send reset email'));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
