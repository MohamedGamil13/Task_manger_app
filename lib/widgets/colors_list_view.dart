import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger_app/colors/note_color.dart';
import 'package:task_manger_app/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:task_manger_app/widgets/color_circle.dart';

class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 20),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<EditNoteCubit>(context).changeNoteColor(index);
              },
              child: ColorCircle(circleColor: noteColors[index]),
            );
          },
        ),
      ),
    );
  }
}
