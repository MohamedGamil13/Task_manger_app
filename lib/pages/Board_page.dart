import 'package:flutter/material.dart';
import 'package:task_manger_app/helpers/app_signture.dart';
import 'package:task_manger_app/widgets/board_appbar.dart';
import 'package:task_manger_app/widgets/board_page_body.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const BoardPageBody(),
      backgroundColor: const Color(0xfff0f4fd),
      appBar: AppBar(
        backgroundColor: Color(0xffb854f2),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}
