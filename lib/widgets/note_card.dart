import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:task_manger_app/models/note_model.dart';
import 'package:task_manger_app/widgets/card_content.dart';
import 'package:task_manger_app/widgets/custom_text.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.noteColor, required this.note});
  final MaterialColor? noteColor;
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [noteColor!, noteColor!.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          leading: CardContent(),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CustomText(text: note.title, fonstsize: 25),
          ),
          trailing: IconButton(
            onPressed: () {
              note.delete();
              BlocProvider.of<AddNoteCubit>(context).fetchAllNotes();
            },
            icon: Icon(Icons.delete),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CustomText(text: note.subTitle, fonstsize: 15),
          ),
        ),
      ),
    );
  }
}
