import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.pageicon,
    required this.onpressed,
  });
  final pageicon;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.purpleAccent.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14),
      ),
      child: IconButton(icon: Icon(pageicon, size: 30), onPressed: onpressed),
    );
  }
}
