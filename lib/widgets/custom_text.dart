import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, required this.fonstsize});
  final String text;
  final double fonstsize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fonstsize, fontWeight: FontWeight.bold),
    );
  }
}
