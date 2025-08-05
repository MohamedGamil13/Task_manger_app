import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:task_manger_app/helpers/constants.dart';
import 'package:task_manger_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  final notebox = Hive.box<NoteModel>(KnoteBoxName);
  AddNoteCubit() : super(AddNoteInitial());
  void addNote({
    required String title,
    required String subtitle,
    required int color,
    String? image,
  }) {
    notebox.add(
      NoteModel(title: title, subTitle: subtitle, image: image!, color: color),
    ); //image and color will be default and user taken
  }
}
