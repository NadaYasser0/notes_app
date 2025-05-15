import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'add_note_form.dart';

class CustomButtomSheet extends StatelessWidget {
  const CustomButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading? true:false,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
              margin: EdgeInsets.only(right:16,left:16,top:32,bottom:MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
