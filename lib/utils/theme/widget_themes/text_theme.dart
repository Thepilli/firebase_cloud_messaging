import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
        color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 28),
    displayMedium: GoogleFonts.montserrat(
        color: Colors.black54, fontWeight: FontWeight.w700, fontSize: 24),
    displaySmall: GoogleFonts.poppins(
        color: Colors.black54, fontWeight: FontWeight.w700, fontSize: 24),
    headlineMedium: GoogleFonts.poppins(
        color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 16),
    titleLarge: GoogleFonts.poppins(
        color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 14),
    bodyLarge: GoogleFonts.poppins(
        color: Colors.black54, fontWeight: FontWeight.normal, fontSize: 14),
    bodyMedium: GoogleFonts.poppins(
        color: Colors.black54, fontWeight: FontWeight.normal, fontSize: 14),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
        color: Colors.white60, fontWeight: FontWeight.bold, fontSize: 28),
    displayMedium: GoogleFonts.montserrat(
        color: Colors.white60, fontWeight: FontWeight.w700, fontSize: 24),
    displaySmall: GoogleFonts.poppins(
        color: Colors.white60, fontWeight: FontWeight.w700, fontSize: 24),
    headlineMedium: GoogleFonts.poppins(
        color: Colors.white60, fontWeight: FontWeight.w600, fontSize: 16),
    titleLarge: GoogleFonts.poppins(
        color: Colors.white60, fontWeight: FontWeight.w600, fontSize: 14),
    bodyLarge: GoogleFonts.poppins(
        color: Colors.white60, fontWeight: FontWeight.normal, fontSize: 14),
    bodyMedium: GoogleFonts.poppins(
        color: Colors.white60, fontWeight: FontWeight.normal, fontSize: 14),
  );
}
