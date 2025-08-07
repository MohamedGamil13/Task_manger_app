import 'package:flutter/material.dart';
import 'package:task_manger_app/colors/note_color.dart';
import 'package:task_manger_app/widgets/color_circle.dart';

class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 20),
      child: SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (int i = 0; i < noteColors.length; i++)
              ColorCircle(circleColor: noteColors[i]),
          ],
        ),
      ),
    );
  }
}
