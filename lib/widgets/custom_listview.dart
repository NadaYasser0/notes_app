import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

import '../models/note_item_model.dart';
import '../views/edit_note_view.dart';
import 'note_item.dart';

class CustomListview extends StatelessWidget {
  const CustomListview({super.key});



  @override
  Widget build(BuildContext context) {

    return BlocBuilder<NotesCubit,NotesState>(
      builder: (context, state) {
        List<NoteItemModel> notes=BlocProvider.of<NotesCubit>(context).notes??[];
        return ListView.separated(
          itemBuilder:
            ( context,  index)  => NoteItem(noteItemModel: notes[index]),
        separatorBuilder:
            ( context, index)  => SizedBox(height: 8),
        itemCount: notes.length ,
      ) ;},

    );
  }
}

