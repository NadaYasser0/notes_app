import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/app_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.onPressed,  this.isLoading=false});
  final Function() onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.all(8),
        ),
        onPressed: onPressed,
        child: isLoading?
        SizedBox(child: CircularProgressIndicator(color: Colors.black12,)):Text('Add', style: AppFonts.title.copyWith(fontSize: 20)),
      ),
    );
  }
}
