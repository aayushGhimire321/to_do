import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/app_color.dart';

TextStyle basicStyle = GoogleFonts.inter(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600);

TextStyle basicGrey = GoogleFonts.inter(color: subTitleColor, fontSize: 15, fontWeight: FontWeight.w400);

TextStyle unselectedStyle = GoogleFonts.inter(
    fontSize: 15, color: const Color(0xFF7D89B0), fontWeight: FontWeight.w500);

TextStyle selectedStyle = GoogleFonts.inter(
    fontSize: 15, color: const Color(0xFF406BBF), fontWeight: FontWeight.w500);
