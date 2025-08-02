import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  void signInWithGoogle() async {
    try {
      emit(LoginLoading());

      // Initialize Google Sign-In
      await GoogleSignIn.instance.initialize(
        serverClientId:
            "625420286680-50g250lbffp65bnqob91cdq0salh666t.apps.googleusercontent.com",
      );
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
          .authenticate();
      if (googleUser == null) {
        emit(LoginFailure());
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      print(googleUser.email);
      emit(LoginSucess());
    } on Exception catch (e) {
      emit(LoginFailure());
      print(e);
    }
  }
}
