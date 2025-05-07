import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'custom_border.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint,this.maxLines=1, this.onSaved, this.onChanged});
  final String hint;
  final int maxLines;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged ,
      onSaved:onSaved ,
      validator: (value){
        if(value?.isEmpty ?? true){
          return "field is required";
        }else {
          return null;
        }
          },
      cursorColor: AppColors.buttonColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        errorBorder: customBorder(),
        border: customBorder(),
        focusedBorder: customBorder().copyWith(
          borderSide: BorderSide(color: AppColors.buttonColor),
        ),
        enabledBorder: customBorder(),
      ),
    );
  }
}
