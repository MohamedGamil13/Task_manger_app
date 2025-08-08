import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  void signUp({required String emailAddress, required String password}) async {
    emit(LoginLoading());
    try {
      final UserCredential credential = await FirebaseAuth.instance
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
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      emit(LoginSucess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure('Wrong password provided for that user.'));
      }
    }
  }
}
