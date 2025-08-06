import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger_app/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:task_manger_app/models/note_model.dart';
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
            const SizedBox(height: 32),
            CustomButton(
              buttonColor: Colors.amber,
              text: 'Edit Note',
              onTap: () {
                inputValidation(context, formKey);
                BlocProvider.of<EditNoteCubit>(context).editNote(
                  note: ModalRoute.of(context)!.settings.arguments as NoteModel,
                  newTitle: title!,
                  newSubtitle: subtitle!,
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void inputValidation(BuildContext context, dynamic globalKey) {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      if (title != null && subtitle != null) {
        try {
          // BlocProvider.of<AddNoteCubit>(context).addNote(
          //   title: title!,
          //   subtitle: subtitle!,
          //   color: Colors.blue.value,
          //   image: '', // Default empty image
          // );
        } catch (e) {
          print('Error accessing EditNoteCubit: $e');
          // Fallback: just close the sheet
        }
      }
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
