import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/app_color.dart';

import '../constants/app_image.dart';

class CustomTextField extends StatelessWidget {
  String? hint;
  Widget? prefix;
  int ? maxLines;
  Widget? suffix;
  double? height;
  TextEditingController? controller;
  bool? obscure;
  CustomTextField(
      {super.key,
      this.controller,
      this.height = 50,
      this.suffix,
      this.prefix,
        this.maxLines = 1,
      this.obscure = false,
      this.hint});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CupertinoTextField(
        obscureText: obscure!,
        maxLines: maxLines,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.black12, // You can adjust the color of the shadow
            blurRadius: 4.0, // Adjust the blur radius as needed
            offset: Offset(
                0, 2), // Adjust the offset to control the shadow's position
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        style: GoogleFonts.inter(fontSize: 17),
        controller: controller,
        placeholderStyle: GoogleFonts.inter(
            color: subTitleColor, fontSize: 17, fontWeight: FontWeight.w400),
        prefix: prefix,
        suffix: suffix,

        placeholder: hint,
      ),
    );
  }
}
