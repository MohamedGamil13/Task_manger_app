import 'package:flutter/material.dart';
import 'package:task_manger_app/widgets/card_content.dart';
import 'package:task_manger_app/widgets/custom_text.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.noteColor});
  final MaterialColor? noteColor;
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
            child: CustomText(text: 'Note', fonstsize: 30),
          ),
          trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          subtitle: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CustomText(
              text: 'today i will do something nice ',
              fonstsize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
