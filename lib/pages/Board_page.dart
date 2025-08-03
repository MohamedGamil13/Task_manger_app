import 'package:flutter/material.dart';

import 'package:task_manger_app/widgets/board_page_body.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const BoardPageBody(),
      backgroundColor: const Color(0xfff0f4fd),
      appBar: AppBar(
        // backgroundColor: Color(0xff00b2ff),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff00b2ff), Color(0xff2292f8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}
