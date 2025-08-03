import 'package:flutter/material.dart';
import 'package:task_manger_app/widgets/task_card_list.dart';

class BoardPageBody extends StatelessWidget {
  const BoardPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskCardList();
  }
}
