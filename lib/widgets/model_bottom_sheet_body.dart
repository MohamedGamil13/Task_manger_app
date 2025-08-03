import 'package:flutter/material.dart';
import 'package:task_manger_app/helpers/add_note_form.dart';

class ModelBottomSheetBody extends StatelessWidget {
  const ModelBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: AddNoteForm());
  }
}

  // void inputValidtion(BuildContext context, dynamic globalKey) {
  //   if (globalKey.currentState!.validate()) {
  //     globalKey.currentState!.save();
  //     if (title != null && subtitle != null) {
  //       NoteModel newnote = NoteModel(
  //         title: title!,
  //         body: subtitle!,
  //         createdAt: DateTime.now().toString(),
  //         color: Colors.blue.value,
  //       );
  //       BlocProvider.of<AddNoteCubit>(context).addNote(newNote: newnote);
  //     } else {
  //       // Optionally show an error message here
  //     }
  //   } else {
  //     setState(() {
  //       autovalidateMode = AutovalidateMode.always;
  //     });
  //   }
  // }

