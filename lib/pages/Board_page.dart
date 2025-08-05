import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:task_manger_app/widgets/add_note_floatingbutton.dart';

import 'package:task_manger_app/widgets/board_page_body.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Scaffold(
        body: const BoardPageBody(),
        backgroundColor: const Color(0xfff0f4fd),
        appBar: AppBar(
          // backgroundColor: Color(0xff00b2ff),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              //color: Color(0xfff0f4fd)
              gradient: LinearGradient(
                colors: [Color(0xff00b2ff), Color(0xfff0f4fd)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        floatingActionButton: AddNoteFloatingbutton(),
      ),
    );
  }
}
//0xff00b2ff