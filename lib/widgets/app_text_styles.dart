import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle get appBarTitle => GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Color(0xFF8D7B68), // New palette: Darkest brown
      fontWeight: FontWeight.w600,
    ),
  );

  static TextStyle get heading => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Color(0xFF8D7B68), // New palette: Darkest brown
      letterSpacing: 1.5,
    ),
  );

  static TextStyle get subHeading => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color(0xFF8D7B68), // New palette: Darkest brown
    ),
  );

  static TextStyle get body => GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 16,
      color: Color(0xFF8D7B68), // New palette: Darkest brown
    ),
  );

  static TextStyle get buttonText => GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Color(0xFFF1DEC9), // New palette: Lightest for contrast on dark button
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
    ),
  );
}