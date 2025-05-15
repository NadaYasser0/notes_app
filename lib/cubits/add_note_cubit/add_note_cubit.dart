import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/models/note_item_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());


  Color color = Color(0xFF432A45);
  addNote(NoteItemModel note) async {
    note.color= color.value;
    emit(AddNoteLoading());
    try{
      var notesBox = Hive.box<NoteItemModel>('notesBox');
      await notesBox.add(note);
      emit(AddNoteSuccess());
    }catch (e){
      emit(AddNoteFailure(e.toString()));
    }
  }
}
