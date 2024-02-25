import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/settings/settings.dart';

class SingleSettings extends StatelessWidget {
  final Widget ? trailing;
  final Widget ? leading;
  final String ? label;
  const SingleSettings({super.key, this.trailing, this.leading, this.label});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 8.0,vertical: 15.0),
        child: ListTile(
          trailing: trailing,
          leading: leading,
          title: Text("$label",
              style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
