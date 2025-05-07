import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_item_model.dart';

import '../add_note_cubit/add_note_cubit.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteItemModel>? notes;
  fetchAllNotes() {
      var notesBox = Hive.box<NoteItemModel>('notesBox');
       notes= notesBox.values.toList();
       emit(NotesSuccess());

  }
}
