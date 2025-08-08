import 'package:flutter/material.dart';
import 'package:task_manger_app/widgets/sign_in_body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SignInBody(),
    );
  }
}
