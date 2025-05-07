import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/custom_listview.dart';
import 'package:notes_app/widgets/note_item.dart';

import '../models/note_item_model.dart';
import '../widgets/add_note_button.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_buttom_sheet.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  static const String route = "NotesView";

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
          child: Column(
            children: [
              const CustomAppBar(
                icon: Icons.search_rounded,
                titleAppBar: 'Notes',
              ),
              SizedBox(height: 24),
              Expanded(child: CustomListview()),
            ],
          ),
        ),
      ),
      floatingActionButton: AddNoteButton(
        onPressed: () {
          print('truee');
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => CustomButtomSheet(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          );
        },
      ),
    );
  }
}
