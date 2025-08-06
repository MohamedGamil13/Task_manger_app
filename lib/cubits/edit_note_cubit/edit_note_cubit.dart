import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:task_manger_app/helpers/constants.dart';
import 'package:task_manger_app/models/note_model.dart';
part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());
  final notebox = Hive.box<NoteModel>(KnoteBoxName);
  void editNote({
    required NoteModel note,
    required String newTitle,
    required String newSubtitle,
    String? newImage,
    int? newColor,
  }) async {
    note.title = newTitle;
    note.subTitle = newSubtitle;
    note.image = newImage ?? note.image;
    note.color = newColor ?? note.color;

    await note.save(); // ده بيعدل النوت فعليًا في Hive

    emit(EditNoteSucess());
  }
}
