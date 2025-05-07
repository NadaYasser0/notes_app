import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_item_model.dart';
import 'package:notes_app/widgets/color_item.dart';

import 'colors_listview.dart';
import 'custom_elevated_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> noteKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: noteKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            hint: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hint: 'Content',
            maxLines: 5,
            onSaved: (value) {
              content = value;
            },
          ),

          ColorsListview(),
          BlocBuilder<AddNoteCubit,AddNoteState>(
            builder: (context, state) {
              return CustomElevatedButton(
                isLoading: state is AddNoteLoading? true:false,
                onPressed: () {
                  if (noteKey.currentState!.validate()) {
                    noteKey.currentState!.save();

                    var currentDate=DateTime.now();
                    var formatCurrentDate=DateFormat.yMd().format(currentDate);
                    var noteItemModel1 = NoteItemModel(
                      titleNote: title!,
                      subTitleNote: content!,
                      date: formatCurrentDate,
                      color: Colors.purple.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(
                        noteItemModel1);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
