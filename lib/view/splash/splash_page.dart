import 'dart:async';

import 'package:finance/core/shared/constants/app_colors.dart';
import 'package:finance/core/shared/constants/app_text_style.dart';
import 'package:finance/core/shared/extensions/sizes.dart';
import 'package:finance/core/shared/routes/named_routes.dart';
import 'package:finance/locator.dart';
import 'package:finance/view/splash/splash_controller.dart';
import 'package:finance/view/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();
  var logger = Logger();

  @override
  void initState() {
    //Inicializa a extensão de tamanhos proporcional do app (pode iniciar aqui no initState ou no buildContext la em baixo)
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Sizes.init(context);
    });

    _splashController.isUserLogged();
    _splashController.addListener(() {
      if (_splashController.state is SplashSucessState) {
        //se tiver usuario logado, vai navegar para a home
        Navigator.of(context).pushReplacementNamed(NamedRoute.homePage);
        logger.i("Sucesso usuario logado foi para a home page");
      } else {
        //se não tiver usuario logado, vai navegar para a onboardingPage
        Navigator.of(context).pushReplacementNamed(NamedRoute.initial);
        logger.w("Usuario nao esta logado, navegar para onboarding page");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.greenGradient,
          ),
        ),
        child: Center(
          child: Text(
            "Finanças",
            style: AppTextStyle.bigText.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
