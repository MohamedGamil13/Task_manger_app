import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:task_manger_app/widgets/custom_text_field.dart';
import 'package:task_manger_app/widgets/custom_button.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
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
            text: 'Add Note',
            onTap: () {
              inputValidation(context, formKey);
              BlocProvider.of<AddNoteCubit>(context).fetchAllNotes();
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void inputValidation(BuildContext context, dynamic globalKey) {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      if (title != null && subtitle != null) {
        try {
          BlocProvider.of<AddNoteCubit>(context).addNote(
            title: title!,
            subtitle: subtitle!,
            color: Colors.blue.value,
            image: '', // Default empty image
          );
          Navigator.pop(context);
        } catch (e) {
          print('Error accessing AddNoteCubit: $e');
          // Fallback: just close the sheet
          Navigator.pop(context);
        }
      } else {
        // Optionally show an error message here
      }
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
