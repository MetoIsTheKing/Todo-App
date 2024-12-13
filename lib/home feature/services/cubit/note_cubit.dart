import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/home%20feature/services/note_model.dart';
import 'package:todo_app/home%20feature/services/notes_repository.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this.repository) : super(NoteInitial());
  final NoteRepository repository;

  Future<void> fetchNotes() async {
    emit(NoteIsLoading());
    try {
      final notes = await repository.fetchNotes();
      if (notes.isEmpty) {
        emit(NoteIsEmpty());
        return;
      }
      emit(NoteLoaded(notes));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }

  void addNewNote({
    required String content,
    required String category,
    required int priority,
    required String color,
  }) async {
    emit(NoteIsLoading());
    try {
      await repository.addNote(
        content: content,
        category: category,
        priority: priority,
        color: color,
      );
      emit(NoteAddedSuccssfully());
      final updatedNotes = await repository.fetchNotes();
      emit(NoteLoaded(updatedNotes));
    } catch (e) {
      emit(NoteError('Failed to add note: $e'));
    }
  }

  void updateNoteStatus({required int id, required bool updates}) async {
    emit(NoteIsLoading());
    try {
      await repository.updateNoteStatus(id, updates);
      emit(NoteUpdatedSuccssfully());
      final updatedNotes = await repository.fetchNotes();
      emit(NoteLoaded(updatedNotes));
    } catch (e) {
      emit(NoteError('Failed to update note: $e'));
    }
  }

  void updateNote(
      {required int id, required Map<String, dynamic> updates}) async {
    emit(NoteIsLoading());
    try {
      await repository.updateNote(id, updates);
      emit(NoteUpdatedSuccssfully());
      final updatedNotes = await repository.fetchNotes();
      emit(NoteLoaded(updatedNotes));
    } catch (e) {
      emit(NoteError('Failed to update note: $e'));
    }
  }

  void deleteNote(int id) async {
    emit(NoteIsLoading());
    try {
      await repository.deleteNote(id);
      emit(NoteDeletedSuccssfully());
      final updatedNotes = await repository.fetchNotes();
      emit(NoteLoaded(updatedNotes));
    } catch (e) {
      emit(NoteError('Failed to delete note: $e'));
    }
  }
}
