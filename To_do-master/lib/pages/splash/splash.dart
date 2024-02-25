import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_color.dart';
import 'package:todo_app/constants/app_image.dart';
import 'package:todo_app/constants/routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    navigate();
    super.initState();
  }

  navigate() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, routeOnboarding);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(alignment: Alignment.center, child: Image.asset(appLogo))
        ],
      ),
    );
  }
}
