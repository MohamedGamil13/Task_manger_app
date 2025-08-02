import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(LoginSucess());
    } on Exception catch (e) {
      emit(LoginFailure());
      print(e);
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success &&
          loginResult.accessToken != null) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(
              loginResult.accessToken!.tokenString,
            );

        await FirebaseAuth.instance.signInWithCredential(
          facebookAuthCredential,
        );

        print(" Facebook login successful!");
      } else {
        print(
          " Facebook login failed: ${loginResult.status} - ${loginResult.message}",
        );
      }
    } catch (e) {
      print(" Error during Facebook sign-in: $e");
    }
  }
}
