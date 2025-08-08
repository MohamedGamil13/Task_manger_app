import 'package:flutter/material.dart';
import 'package:task_manger_app/helpers/app_signture.dart';
import 'package:task_manger_app/widgets/custom_text.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: AppSignture(fontSize: 50, logoHeight: 65),
          ),
          SizedBox(height: 100),
          CustomText(text: 'Your thoughts, organized', fonstsize: 25),
          Text("Fast,  Simple,  Secure ", style: TextStyle(fontSize: 15)),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
