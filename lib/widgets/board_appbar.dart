import 'package:flutter/material.dart';
import 'package:task_manger_app/helpers/app_signture.dart';

class BoardAppbar extends StatelessWidget {
  const BoardAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [AppSignture(fontSize: 30, logoHeight: 35)],
      ),
    );
  }
}
