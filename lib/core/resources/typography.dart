import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle h1TitleBlack = GoogleFonts.quicksand(
      color: Colors.black87, fontSize: 24, fontWeight: FontWeight.bold
  );
  static TextStyle h1TitleWhite = GoogleFonts.quicksand(
      color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold
  );
  static TextStyle h2TitleBlack = GoogleFonts.quicksand(
      color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold
  );
  static TextStyle h3TitleBlack = GoogleFonts.quicksand(
      color: Colors.black87, fontSize: 17, fontWeight: FontWeight.bold
  );

  static TextStyle h3TitleWhite = GoogleFonts.quicksand(
      color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold
  );
  static TextStyle h2TitleWhite = GoogleFonts.quicksand(
      color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold
  );
  static TextStyle headerSmall = const TextStyle(
    color: Color(0xFF222222),
    fontSize: 15,
    fontFamily: 'Archivo',
    fontWeight: FontWeight.w700,
    height: 0,
    letterSpacing: -0.68,
  );
  static TextStyle smallSubtitle = const TextStyle(
    color: Color(0xFF222222),
    fontSize: 12,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    height: 0,
    letterSpacing: -0.48,
  );

  static TextStyle inputHint = GoogleFonts.quicksand(
      color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold);
}