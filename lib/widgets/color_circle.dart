import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({super.key, required this.circleColor});
  final Color circleColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: 30, backgroundColor: circleColor);
  }
}
