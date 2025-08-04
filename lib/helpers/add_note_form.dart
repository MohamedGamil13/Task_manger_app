import 'package:flutter/material.dart';
import 'package:task_manger_app/widgets/custom_button.dart';
import 'package:task_manger_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: globalKey,

        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomTextfeild(
              label: 'Title',
              onSaved: (value) {
                title = value;
              },
            ),
            SizedBox(height: 20),
            CustomTextfeild(
              label: 'Content',
              maxlines: 4,
              onSaved: (value) {
                subtitle = value;
              },
            ),
            SizedBox(height: 50),
            CustomButton(
              text: 'Add Note',
              onTap: () {
                // inputValidtion(context);
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
