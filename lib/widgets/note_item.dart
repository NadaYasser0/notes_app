import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/utils/app_fonts.dart';

import '../models/note_item_model.dart';
import '../views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.noteItemModel});
  final NoteItemModel noteItemModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return EditNoteView(noteItemModel: noteItemModel,);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 24, bottom: 24),
        decoration: BoxDecoration(
          color: Color(noteItemModel.color),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              trailing: IconButton(
                padding: EdgeInsets.only(
                  left: 30,
                  bottom: 36,
                  right: 0,
                  top: 0,
                ),
                onPressed: () {
                  noteItemModel.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: Icon(Icons.delete_rounded, color: Colors.black, size: 35),
              ),
              title: Text(noteItemModel.titleNote),
              subtitle: Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 24.0),
                child: Text(noteItemModel.subTitleNote),
              ),
              titleTextStyle: AppFonts.title,
              subtitleTextStyle: AppFonts.subTitle,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(
                noteItemModel.date,
                style: AppFonts.subTitle.copyWith(fontSize: 16),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
