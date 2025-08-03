import 'package:flutter/material.dart';
import 'package:task_manger_app/widgets/add_note_floatingbutton.dart';

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
          decoration: const BoxDecoration(color: Color(0xff00b2ff)),
        ),
      ),
      floatingActionButton: AddNoteFloatingbutton(),
    );
  }
}
