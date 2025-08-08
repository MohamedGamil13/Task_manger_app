import 'package:flutter/material.dart';

class HorzontailDivider extends StatelessWidget {
  const HorzontailDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(indent: 27, endIndent: 27)),
        Text("OR"),
        Expanded(child: Divider(indent: 27, endIndent: 27)),
      ],
    );
  }
}
