import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';

import '../utils/app_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.icon,
    required this.titleAppBar,
    this.onPressed,
  });
  final String titleAppBar;
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(titleAppBar, style: AppFonts.appBarTitle),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            color: AppColors.iconBgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            onPressed: onPressed,
            color: Colors.white,
            iconSize: 30,
            icon: Icon(icon),
            padding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }
}
