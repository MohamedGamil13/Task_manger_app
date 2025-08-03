import 'package:flutter/material.dart';
import 'package:task_manger_app/widgets/note_card.dart';

class TaskCardList extends StatelessWidget {
  const TaskCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return NoteCard();
      },
    );

    // Padding(
    //   padding: const EdgeInsets.only(left: 18, right: 18),
    //   child: SizedBox(
    //     width: MediaQuery.of(context).size.width - 30,
    //     height: MediaQuery.of(context).size.height / 4 - 50,
    //     child: const Card(color: Colors.amber, child: CardContent()),
    //   ),
    // );
  }
}
