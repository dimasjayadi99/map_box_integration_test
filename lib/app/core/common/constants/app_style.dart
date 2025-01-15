import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color primaryColor = const Color(0xff212121);
  static Color secondaryColor = const Color(0xffDADADA);
  static Color thirdColor = const Color(0xffFFB765);

  static TextTheme myTextTheme = TextTheme(
    /// display for logo text style
    displayMedium: GoogleFonts.museoModerno(
        fontSize: 24, fontWeight: FontWeight.normal, color: secondaryColor),
    titleLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
        color: secondaryColor),
    titleMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: secondaryColor),
    titleSmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: secondaryColor),
    bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.5,
        color: secondaryColor),
    bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.25,
        color: secondaryColor),
    bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.25,
        color: secondaryColor),
    labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.5,
        color: secondaryColor),
    labelMedium: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.25,
        color: secondaryColor),
    labelSmall: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.25,
        color: secondaryColor),
  );
}
