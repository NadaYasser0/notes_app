import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_item_model.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/edit_note_color_listview.dart';

import '../widgets/custom_app_bar.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.noteItemModel});
  final NoteItemModel noteItemModel;
  static const String route = "EditNoteView";

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? content, title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
          child: Column(
            children: [
              CustomAppBar(
                icon: Icons.check,
                titleAppBar: 'Edit Note',
                onPressed: () {
                  widget.noteItemModel.titleNote=title ?? widget.noteItemModel.titleNote;
                  widget.noteItemModel.subTitleNote=content?? widget.noteItemModel.subTitleNote;
                  widget.noteItemModel.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                  },
              ),
              const SizedBox(height: 32),
              CustomTextField(
                hint: widget.noteItemModel.titleNote,
                onChanged: (value) {
                  title = value;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hint: widget.noteItemModel.subTitleNote,
                maxLines: 5,
                onChanged: (value) {
                  content = value;
                },
              ),
              SizedBox(height: 16,),
              EditNoteColorListview(noteItemModel: widget.noteItemModel,),

            ],
          ),
        ),
      ),
    );
  }
}
