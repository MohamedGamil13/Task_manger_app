import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger_app/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:task_manger_app/models/note_model.dart';
import 'package:task_manger_app/widgets/colors_list_view.dart';
import 'package:task_manger_app/widgets/custom_text_field.dart';
import 'package:task_manger_app/widgets/custom_button.dart';

class EditNoteForm extends StatefulWidget {
  const EditNoteForm({super.key});

  @override
  State<EditNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<EditNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    final note = ModalRoute.of(context)!.settings.arguments as NoteModel;

    return BlocListener<EditNoteCubit, EditNoteState>(
      listener: (context, state) {
        if (state is EditNoteSucess) {
          Navigator.pop(context, true);
        }
      },
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 32),
            CustomTextfeild(
              onSaved: (value) {
                title = value;
              },
              label: 'Title',
            ),
            const SizedBox(height: 16),
            CustomTextfeild(
              onSaved: (value) {
                subtitle = value;
              },
              label: 'Content',
              maxlines: 5,
            ),
            const SizedBox(height: 20),
            ColorsListView(),
            CustomButton(
              buttonColor: const Color(0xff00b2ff),
              text: 'Edit Note',
              onTap: () {
                inputValidation(context, formKey, note);
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void inputValidation(
    BuildContext context,
    GlobalKey<FormState> globalKey,
    NoteModel note,
  ) {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();

      final updatedTitle = title?.isNotEmpty == true ? title! : note.title;
      final updatedSubtitle = subtitle?.isNotEmpty == true
          ? subtitle!
          : note.subTitle;

      BlocProvider.of<EditNoteCubit>(context).editNote(
        note: note,
        newTitle: updatedTitle,
        newSubtitle: updatedSubtitle,
        newColor: BlocProvider.of<EditNoteCubit>(context).selectedcolor,
      );
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
