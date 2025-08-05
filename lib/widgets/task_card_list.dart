import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger_app/colors/note_color.dart';
import 'package:task_manger_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:task_manger_app/widgets/note_card.dart';

class TaskCardList extends StatelessWidget {
  const TaskCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: BlocProvider.of<AddNoteCubit>(context).notebox.length,
      itemBuilder: (context, index) {
        return NoteCard(noteColor: noteColors[index % 19]);
      },
    );
  }
}
