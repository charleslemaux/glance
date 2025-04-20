import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle get appBarTitle => GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
  );

  static TextStyle get heading => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.5,
    ),
  );

  static TextStyle get subHeading => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static TextStyle get body => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 16,
      color: Colors.white70,
    ),
  );

  static TextStyle get buttonText => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
    ),
  );
}