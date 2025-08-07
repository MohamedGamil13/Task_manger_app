import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_manger_app/colors/note_color.dart';
import 'package:task_manger_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:task_manger_app/helpers/constants.dart';
import 'package:task_manger_app/models/note_model.dart';
import 'package:task_manger_app/widgets/custom_text.dart';
import 'package:task_manger_app/widgets/note_card.dart';

class TaskCardList extends StatefulWidget {
  const TaskCardList({super.key});

  @override
  State<TaskCardList> createState() => _TaskCardListState();
}

class _TaskCardListState extends State<TaskCardList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        final box = Hive.box<NoteModel>(KnoteBoxName).values.toList();

        if (box.isEmpty) {
          return Center(
            child: CustomText(text: 'No notes yet 😴', fonstsize: 35),
          );
        }
        return ListView.builder(
          itemCount: BlocProvider.of<AddNoteCubit>(context).notebox.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                final res = await Navigator.pushNamed(
                  context,
                  "EditNotePage",
                  arguments: box[index],
                );
                if (res == true) {
                  setState(() {});
                }
              },
              child: NoteCard(
                noteColor: noteColors[box[index].color % 19 ?? 1],
                note: box[index],
              ),
            );
          },
        );
      },
    );
  }
}
