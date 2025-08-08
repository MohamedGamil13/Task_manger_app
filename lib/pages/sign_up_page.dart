import 'package:flutter/material.dart';
import 'package:task_manger_app/widgets/sign_up_body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: SignUpBody(),
    );
  }
}


