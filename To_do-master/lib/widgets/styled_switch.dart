import 'package:flutter/material.dart';

class StyledSwitch extends StatefulWidget {
  bool ? toogle;
  final void Function(bool isToggled) onToggled;

  StyledSwitch({Key? key, required this.onToggled,this.toogle = false}) : super(key: key);

  @override
  State<StyledSwitch> createState() => _StyledSwitchState();
}

class _StyledSwitchState extends State<StyledSwitch> {
  bool isToggled = false;
  double size = 35;
  double innerPadding = 0;

  @override
  void initState() {
    innerPadding = size / 5;
    isToggled = widget.toogle!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isToggled = !isToggled);
        widget.onToggled(isToggled);
      },
      onPanEnd: (b) {
        setState(() => isToggled = !isToggled);
        widget.onToggled(isToggled);
      },
      child: AnimatedContainer(
        height: size,
        width: size * 1.7,
        padding: EdgeInsets.all(innerPadding),
        alignment: isToggled ? Alignment.centerRight : Alignment.centerLeft,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isToggled ? Colors.green : Colors.grey.shade300,
        ),
        child: Container(
          width: size - innerPadding * 2,
          height: size - innerPadding * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: isToggled ? Colors.white : Colors.white,
          ),
        ),
      ),
    );
  }
}