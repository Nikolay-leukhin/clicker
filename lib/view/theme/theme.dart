import 'package:clicker/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: AppColors.base,
        titleTextStyle: GoogleFonts.openSans(color: AppColors.earth, fontSize: 25, fontWeight: FontWeight.w600)
    ),
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.openSans(color: AppColors.earth, fontSize: 25, fontWeight: FontWeight.w600),
      bodyMedium: GoogleFonts.openSans(color: AppColors.base, fontWeight: FontWeight.bold, fontSize: 25),
      bodySmall: GoogleFonts.openSans(color: AppColors.base, fontWeight: FontWeight.w300, fontSize: 20),
    ));
