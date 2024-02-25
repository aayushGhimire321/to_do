import 'package:flutter/material.dart';

class CustomTabs extends StatelessWidget {
  String? label;
  TextStyle? style;
  void Function()? onTap;
  CustomTabs({
    super.key,
    this.onTap,
    this.label,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          label ?? "",
          style: style,
        ),
      ),
    );
  }
}
