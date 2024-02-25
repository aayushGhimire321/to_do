import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_color.dart';
import 'package:todo_app/constants/routes.dart';
import 'package:todo_app/pages/navigation/navigation.dart';
import 'package:todo_app/pages/onboarding/onboarding.dart';
import 'package:todo_app/pages/signin/signin.dart';
import 'package:todo_app/pages/signup/signup.dart';
import 'package:todo_app/pages/splash/splash.dart';
import 'package:todo_app/pages/task_detail/task_detail.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: ThemeData(
          useMaterial3: false,
          appBarTheme: const AppBarTheme(backgroundColor: bg, elevation: 0.0),
          scaffoldBackgroundColor: bg),
      initialRoute: routeSplash,
      routes: {
        routeSplash: (context) => const Splash(),
        routeOnboarding: (context) => const Onboarding(),
        routeSignup: (context) => const SignUp(),
        routeSignIn: (context) => const SignIn(),
        routeNavigation: (context) => const Navigation(),
        routeTaskDetail: (context) => TaskDetail(),
      },
    );
  }
}
