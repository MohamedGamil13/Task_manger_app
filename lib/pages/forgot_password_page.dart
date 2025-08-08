import 'package:flutter/material.dart';
import 'package:task_manger_app/widgets/forgot_password_body.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: ForgotPasswordBody(),
    );
  }
}


