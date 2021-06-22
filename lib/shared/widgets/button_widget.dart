import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CRONO/core/core.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;

  ButtonWidget({
    this.label,
    this.backgroundColor,
    this.fontColor,
    this.borderColor,
    this.onTap,
  });

  ButtonWidget.red({
    String label,
    VoidCallback onTap,
  })  : this.backgroundColor = AppColors.red,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.red,
        this.onTap = onTap,
        this.label = label;

  ButtonWidget.transparent({
    String label,
    VoidCallback onTap,
  })  : this.backgroundColor = Colors.transparent,
        this.fontColor = AppColors.black,
        this.borderColor = Colors.transparent,
        this.onTap = onTap,
        this.label = label;

  ButtonWidget.green({
    String label,
    VoidCallback onTap,
  })  : this.backgroundColor = AppColors.green,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.green,
        this.onTap = onTap,
        this.label = label;

  ButtonWidget.blue({
    String label,
    VoidCallback onTap,
  })  : this.backgroundColor = AppColors.blue,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.blue,
        this.onTap = onTap,
        this.label = label;

  ButtonWidget.white({
    String label,
    VoidCallback onTap,
  })  : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.black,
        this.borderColor = AppColors.white,
        this.onTap = onTap,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 52,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            backgroundColor,
          ),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          side: MaterialStateProperty.all(BorderSide(color: borderColor)),
        ),
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(label,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: fontColor,
              )),
        ),
      ),
    );
  }
}
