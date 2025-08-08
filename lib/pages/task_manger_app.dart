import 'package:flutter/material.dart';
import 'package:task_manger_app/pages/Board_page.dart';
import 'package:task_manger_app/pages/edit_note_page.dart';
import 'package:task_manger_app/pages/home_page.dart';
import 'package:task_manger_app/pages/sign_in_page.dart';
import 'package:task_manger_app/pages/sign_up_page.dart';
import 'package:task_manger_app/pages/forgot_password_page.dart';

class TaskMangerApp extends StatelessWidget {
  const TaskMangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(fontFamily: 'Poppins'),
      routes: {
        "BordarPage": (context) => BoardPage(),
        "EditNotePage": (context) => EditNotePage(),
        "SignInPage": (context) => SignInPage(),
        "SignUpPage": (context) => const SignUpPage(),
        "ForgotPasswordPage": (context) => const ForgotPasswordPage(),
      },
    );
  }
}
