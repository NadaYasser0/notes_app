import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key, required this.onPressed});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: CircleBorder(),

      elevation: 3,
      shadowColor: Colors.black,
      child: CircleAvatar(
        radius: 32,
        backgroundColor: AppColors.buttonColor,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.add_rounded,
            color: Colors.black,
            size: 30,
            weight: 50,
          ),
        ),
      ),
    );
  }
}
