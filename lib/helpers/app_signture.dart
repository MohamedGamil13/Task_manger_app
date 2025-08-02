import 'package:flutter/material.dart';
import 'package:task_manger_app/helpers/app_logo.dart';
import 'package:task_manger_app/helpers/constants.dart';

class AppSignture extends StatelessWidget {
  const AppSignture({
    super.key,
    required this.fontSize,
    required this.logoHeight,
  });
  final double fontSize;
  final double logoHeight;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppLogo(height: logoHeight),
        Padding(
          padding: EdgeInsets.only(left: 6.0),
          child: Text(KappName, style: TextStyle(fontSize: fontSize)),
        ),
      ],
    );
  }
}
