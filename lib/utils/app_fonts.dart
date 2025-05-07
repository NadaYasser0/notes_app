import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppFonts{
  static TextStyle title=GoogleFonts.inter(
      fontSize: 32,
      color:Colors.black,
      fontWeight: FontWeight.w500,
  );
  static TextStyle subTitle=GoogleFonts.inter(
      fontSize: 24,
      color:AppColors.txtColor,
      fontWeight: FontWeight.w400,
  );
  static TextStyle appBarTitle=GoogleFonts.inter(
      fontSize: 28,
      color:Colors.white,
      fontWeight: FontWeight.w500,
  );

}