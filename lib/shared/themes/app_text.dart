import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';

class AppText {
  // ignore: non_constant_identifier_names
  static final title = GoogleFonts.archivo(
      fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.title
  );

  static final description = GoogleFonts.archivo(
      fontSize: 22, fontWeight: FontWeight.w500, color: AppColors.text
  );

  static final input = GoogleFonts.archivo(
      fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.text
  );

  // ignore: non_constant_identifier_names
  static final error = GoogleFonts.archivo(
      fontSize: 20, fontWeight: FontWeight.normal, color: AppColors.error
  );

  // ignore: non_constant_identifier_names
  static final buttonTitle = GoogleFonts.archivo(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white
  );
}
