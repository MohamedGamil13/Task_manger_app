import 'package:flutter/material.dart';
import 'package:task_manger_app/pages/Board_page.dart';
import 'package:task_manger_app/pages/home_page.dart';

class TaskMangerApp extends StatelessWidget {
  const TaskMangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BoardPage(),
      theme: ThemeData(fontFamily: 'Poppins'),
    );
  }
}
