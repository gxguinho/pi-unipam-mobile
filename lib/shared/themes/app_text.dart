import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';

class AppText {
  static final Title = GoogleFonts.archivo(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.title
  );

  static final Description = GoogleFonts.archivo(
    fontSize: 26,
    fontWeight: FontWeight.w500,
    color: AppColors.title
  );

  static final Error = GoogleFonts.archivo(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.error
  );

  static final ButtonTitle = GoogleFonts.archivo(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.white
  );
}