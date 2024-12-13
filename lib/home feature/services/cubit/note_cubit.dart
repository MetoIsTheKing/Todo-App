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
      if(notes.isEmpty){
        emit(NoteIsEmpty());
      }
      emit(NoteLoaded(notes));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }
}
