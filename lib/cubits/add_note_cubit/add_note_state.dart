part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteSucess extends AddNoteState {
  final List<NoteModel> notes;
  AddNoteSucess({required this.notes});
}
