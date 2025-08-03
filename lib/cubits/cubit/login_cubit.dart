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

      // 1. إنشاء كائن GoogleSignIn بالطريقة الجديدة
      await GoogleSignIn.instance.initialize(
        serverClientId:
            "625420286680-50g250lbffp65bnqob91cdq0salh666t.apps.googleusercontent.com",
      );

      // 2. تأكد من تسجيل الخروج السابق عشان يبدأ من جديد
      await GoogleSignIn.instance.signOut();

      // 3. بدء عملية تسجيل الدخول
      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
          .authenticate();

      // 4. في حالة تم الإلغاء
      if (googleUser == null) {
        emit(LoginFailure());
        return;
      }

      // 5. جلب التوكن
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // 6. تكوين الكريدنشيال
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.idToken,
        idToken: googleAuth.idToken,
      );

      // 7. تسجيل الدخول في Firebase
      await FirebaseAuth.instance.signInWithCredential(credential);

      emit(LoginSucess());
    } catch (e) {
      emit(LoginFailure());
      print("Google Sign-In Error: $e");
    }
  }
}
