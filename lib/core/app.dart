import 'package:finance/view/onboarding/onboarding_page.dart';
import 'package:finance/view/splash/splash_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const SplashPage(),
      home: const OnboardingPage(),
    );
  }
}