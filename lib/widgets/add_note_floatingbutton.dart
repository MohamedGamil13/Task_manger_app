import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:task_manger_app/widgets/model_bottom_sheet_body.dart';

class AddNoteFloatingbutton extends StatelessWidget {
  const AddNoteFloatingbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        final cubit = context.read<AddNoteCubit>();
        showModalBottomSheet(
          context: context,
          isScrollControlled: true, // مهمة علشان الفورم ما يتقطعش
          builder: (context) {
            return BlocProvider.value(
              value: cubit,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(
                    context,
                  ).viewInsets.bottom, // علشان لما الكيبورد يفتح
                ),
                child: ModelBottomSheetBody(),
              ),
            );
          },
        );
      },
    );
  }
}
