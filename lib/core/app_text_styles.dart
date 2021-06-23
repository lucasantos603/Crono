import 'package:CRONO/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: 30,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle mainHeading = GoogleFonts.kulimPark(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );

  static final TextStyle titleBold = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading20 = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle heading30 = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: 25,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle body = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle labelHidratacao = GoogleFonts.lato(
    color: AppColors.hidratacao,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle labelNutricao = GoogleFonts.lato(
    color: AppColors.nutricao,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle labelReconstrucao = GoogleFonts.lato(
    color: AppColors.reconstrucao,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle labelBold = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle info = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle menuItemBold = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle contentTitleBold = GoogleFonts.lato(
    color: AppColors.blue,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle bodyLink = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  /*
  static final TextStyle bodyLink = GoogleFonts.lato(
    shadows: [Shadow(color: AppColors.black, offset: Offset(0, -5))],
    color: Colors.transparent,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.black,
    decorationThickness: 1,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  */

  static final TextStyle small = GoogleFonts.lato(
    color: AppColors.lightGray,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle footer = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 1,
  );
}
