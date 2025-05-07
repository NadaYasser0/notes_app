import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/note_item_model.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../utils/app_colors.dart';
import 'color_item.dart';

class EditNoteColorListview extends StatefulWidget {
  const EditNoteColorListview({super.key, required this.noteItemModel});
  final NoteItemModel noteItemModel;

  @override
  State<EditNoteColorListview> createState() => _EditNoteColorListviewState();
}

class _EditNoteColorListviewState extends State<EditNoteColorListview> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex=AppColors.listviewColors.indexOf(Color(widget.noteItemModel.color));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 38 * 2 ,
    child: ListView.builder(
    itemCount: AppColors.listviewColors.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6.0),
    child: GestureDetector(
    onTap: () {

    currentIndex = index;
    widget.noteItemModel.color=AppColors.listviewColors[index].value;
    setState(() {});
    },
    child: ColorItem(isActive: currentIndex == index, color: AppColors.listviewColors[index],),
    ),
    );
    },
    ),
    );

  }
}
