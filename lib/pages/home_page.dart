import 'package:flutter/material.dart';
import 'package:task_manger_app/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePageBody(),
      backgroundColor: Color(0xfff0f4fd),
    );
  }
}
