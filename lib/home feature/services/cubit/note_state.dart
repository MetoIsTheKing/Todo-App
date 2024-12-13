part of 'note_cubit.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}
final class NoteIsLoading extends NoteState {}
final class NoteIsEmpty extends NoteState {}
final class NoteError extends NoteState {
  final String message;
  NoteError(this.message);
}
final class NoteLoaded extends NoteState {
  final List<Note> notes;
  NoteLoaded(this.notes);
}