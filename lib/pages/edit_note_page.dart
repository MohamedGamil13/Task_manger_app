import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger_app/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:task_manger_app/widgets/edit_note_form.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditNoteCubit(),
      child: Scaffold(
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
        body: EditNoteForm(),
      ),
    );
  }
}
