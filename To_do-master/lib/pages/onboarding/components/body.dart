import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardBody extends StatelessWidget {
  String title;
  String subTitle;
  String image;
  OnboardBody(
      {super.key,
      required this.image,
      required this.subTitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    // TextStyle? header =
    // const TextStyle(fontSize: 19.0, fontWeight: FontWeight.w600);
    // TextStyle? body = const TextStyle(fontSize: 16.0, color: Color(0xFF30353E));
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
          ),
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              title.toString(),
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.inter(fontSize: 26, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              subTitle.toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: const Color(0xFF1C1243)),
            ),
          )
        ],
      ),
    );
  }
}
