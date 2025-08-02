import 'package:flutter/material.dart';
import 'package:task_manger_app/helpers/app_logo.dart';
import 'package:task_manger_app/helpers/constants.dart';

class AppSignture extends StatelessWidget {
  const AppSignture({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        AppLogo(),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(KappName, style: TextStyle(fontSize: 50)),
        ),
      ],
    );
  }
}
