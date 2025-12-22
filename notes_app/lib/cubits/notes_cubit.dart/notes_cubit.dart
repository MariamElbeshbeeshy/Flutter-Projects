import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/helper/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial()) {
    fetchNotes();
  }

  fetchNotes() {
    Box<NoteModel> notesBox = Hive.box(kNotesBox);
    emit(NotesSuccess(notesBox.values.toList()));
  }
}
