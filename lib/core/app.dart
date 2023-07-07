import 'package:finance/core/shared/routes/named_routes.dart';
import 'package:finance/view/home/home_page_view.dart';
import 'package:finance/view/onboarding/onboarding_page.dart';
import 'package:finance/view/profile/profile_page.dart';
import 'package:finance/view/sign_in/sign_in_page.dart';
import 'package:finance/view/sign_up/sign_up_page.dart';
import 'package:finance/view/splash/splash_page.dart';
import 'package:finance/view/stats/stats_page.dart';
import 'package:finance/view/wallet/wallet_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(    
      initialRoute:  NamedRoute.splash,
      routes: {
        NamedRoute.initial: (context) => const OnboardingPage(),
        NamedRoute.splash: (context) => const SplashPage(),
        NamedRoute.signUp: (context) => const SignUpPage(),
        NamedRoute.signIn: (context) => const SignInPage(),
        NamedRoute.homePage: (context) => const HomePageView(),      
        NamedRoute.stats: (context) => const StatsPage(),
        NamedRoute.wallet: (context) => const WalletPage(),
        NamedRoute.profile: (context) => const ProfilePage(),
      },
    );
  }
}
