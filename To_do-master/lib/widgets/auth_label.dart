import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_image.dart';

class AuthLabel extends StatelessWidget {
  String label;
  AuthLabel({super.key,required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: label,
              style: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
            ),
            WidgetSpan(
              child: Image.asset(spark, height: 40, width: 40),
            )
          ])),
    );
  }
}
