import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/routes.dart';
import 'package:todo_app/widgets/auth_label.dart';
import 'package:todo_app/widgets/buttons.dart';
import 'package:todo_app/widgets/custom_text_field.dart';
import 'package:todo_app/widgets/leading_icon.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool visibility1 = true;
  bool visibility2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingIcon(),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          AuthLabel(label: "Sign Up"),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            hint: "Username",
            prefix: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SvgPicture.asset(userSvg),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            hint: "Password",
            obscure: visibility1,
            prefix: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SvgPicture.asset(passwordSvg),
            ),
            suffix: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                  onTap: (){
                    setState(() {
                      visibility1 = !visibility1;
                    });
                  },
                  child: SvgPicture.asset(eyeSvg)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            obscure: visibility2,
            hint: "Confirm password",
            suffix: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                  onTap: (){
                    setState(() {
                      visibility2 = !visibility2;
                    });
                  },
                  child: SvgPicture.asset(eyeSvg)),
            ),
            prefix: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SvgPicture.asset(passwordSvg),
            ),
          ),

          const SizedBox(
            height: 30,
          ),
          Buttons(
            onPressed: (){
              Navigator.pushReplacementNamed(context, routeNavigation);
            },
            buttonName: "Sign Up",
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    height: 2,
                    color: Colors.grey.shade400,
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Or Sign up with",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: const Color(0xFFA29EB6)),
                  ),
                ),
                Expanded(
                  child: Divider(
                    height: 2,
                    color: Colors.grey.shade400,
                    thickness: 2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    sign1,
                    height: 70,
                  ),
                ),
                Expanded(
                  child: Image.asset(sign2, height: 70),
                ),
                Expanded(
                  child: Image.asset(sign3, height: 70),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
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
                          Navigator.pushNamed(context, routeSignIn);
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
    );
  }
}
