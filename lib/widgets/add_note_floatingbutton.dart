import 'package:flutter/material.dart';
import 'package:task_manger_app/widgets/model_bottom_sheet_body.dart';

class AddNoteFloatingbutton extends StatelessWidget {
  const AddNoteFloatingbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return ModelBottomSheetBody();
          },
        );
      },
    );
  }
}
