import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/app_color.dart';

class Buttons extends StatelessWidget {
  void Function()? onPressed;
  String? buttonName;
  Color? backgroundColor;
  double ? height;
  Buttons(
      {super.key,
        this.height = 60,
        this.buttonName, this.onPressed, this.backgroundColor =  primary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: Text(
            buttonName ?? "",
            style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 17, color: Colors.white),
          ),
        )
      ),
    );
  }
}
