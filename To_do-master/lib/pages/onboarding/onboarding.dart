import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:todo_app/constants/app_color.dart';
import 'package:todo_app/constants/routes.dart';
import 'package:todo_app/widgets/buttons.dart';
import '../../constants/app_image.dart';
import 'components/body.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int currentPage = 0;
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      imageFlex: 2,
      safeArea: 0.3,
      pageColor: Colors.white,
      imagePadding: EdgeInsets.symmetric(vertical: 10),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "",
          bodyWidget: OnboardBody(
              image: onBoard1,
              title: "Your convenience in making a todo list",
              subTitle:
                  "Welcome !!! Do you want to clear task super fast with todo?"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [
              OnboardBody(
                image: onBoard2,
                title: "Find the practicality in making your todo list",
                subTitle:
                    "Breaking down life into Tasks makes it easy Get started with us!",
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: Buttons(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, routeSignup);
                  },
                  buttonName: "Get Started",
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: RichText(
                    text: TextSpan(
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: const Color(0xFFA29EB6)),
                        children: [
                      const TextSpan(text: "Already have an account? "),
                      TextSpan(
                          text: "Sign in",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(
                                  context, routeSignup);
                            },
                          style: GoogleFonts.inter(
                            color: primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                          )),
                    ])),
              )
            ],
          ),
          decoration: pageDecoration,
        ),
      ],
      showSkipButton: currentPage == 0 ? true : false,
      onChange: (index) {
        setState(() {
          currentPage = index;
        });
        print(currentPage);
      },
      showDoneButton: currentPage == 0 ? true : false,
      skipOrBackFlex: 0,
      onSkip: () {
        Navigator.pushReplacementNamed(context, routeSignIn);
      },
      skip: Text(
        "skip",
        style: GoogleFonts.inter(
          fontSize: 17,
        ),
      ),
      nextFlex: 0,
      done: Text(
        "Continue",
        style: GoogleFonts.inter(fontSize: 17),
      ),
      onDone: () {
        // RouteGenerator.replacePage(NavigationScreen.routeName);
      },

      next: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle, color: primary),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(
            Icons.arrow_forward_ios_sharp,
            color: Colors.white,
          ),
        ),
      ),

      // next: const Text('Next',
      //     style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),

      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: currentPage == 0
          ? const DotsDecorator(
              size: Size(8.0, 8.0),
              color: Colors.grey,
              activeSize: Size(15.0, 5.0),
              activeColor: primary,
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            )
          : const DotsDecorator(activeColor: Colors.white, color: Colors.white),
    );
  }
}
