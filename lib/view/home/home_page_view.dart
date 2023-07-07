import 'dart:developer';

import 'package:finance/core/shared/components/custom_bottom_app_bar/custom_bottom_app_bar.dart';
import 'package:finance/core/shared/constants/app_colors.dart';
import 'package:finance/view/home/home_page.dart';
import 'package:finance/view/profile/profile_page.dart';
import 'package:finance/view/stats/stats_page.dart';
import 'package:finance/view/wallet/wallet_page.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> with AutomaticKeepAliveClientMixin<HomePageView>{
     /*
  with AutomaticKeepAliveClientMixin<StatsPage>:
  Imagina que eu tenho um pageView com 4 paginas
  pagina1 - pagina2 - pagina3 - pagina4,
  se eu estou na pagina1 o pageView vai criar ela, porém se eu navegar para a pagina2, o pageView vai destruir a pagina1 e construir a pagina2
  e assim por diante, se eu voltar para a pagina1 o pageView vai destruir a pagina2 e construir a pagina1 novamente, isso pode ser um problema (o flutter utiliza isso para evitar o consumo de memoria)
  para evitar isso eu posso utilizar o AutomaticKeepAliveClientMixin, ele vai manter a pagina viva, ou seja, se eu estou na pagina1 e vou para a pagina2, a pagina1 nao vai ser destruida, ela vai ficar viva

  Ou seja o AutomaticKeepAliveClientMixin vai persistir a pagina
*/
  // bool get wantKeepAlive => true; -> metodo do AutomaticKeepAliveClientMixin, se eu deixar TRUE ele mantem a pagina viva eu nao quero fazer o dispose dela

  //!quando usar:
  //é bom utilizar quando tem chamadas async nas telas !! para assim nao consumir recurso atoa do usuario
  //caso for só utilizar dados fixo não precisa por
  @override
  bool get wantKeepAlive => true;




  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      log(pageController.page.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); //-> metodo do AutomaticKeepAliveClientMixin    
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const [
            HomePage(),
            StatsPage(),
            WalletPage(),
            ProfilePage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.green,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomAppBar(
            selectedItemColor: AppColors.green,
            children: [
              CustomBottomAppBarItem(
                label: "home",
                primaryIcon: Icons.home,
                secondaryIcon: Icons.home_outlined,
                onPressed: () => pageController.jumpToPage(
                  0,
                ),
              ),
              CustomBottomAppBarItem(
                label: "stats",
                primaryIcon: Icons.analytics,
                secondaryIcon: Icons.analytics_outlined,
                onPressed: () => pageController.jumpToPage(
                  1,
                ),
              ),
              CustomBottomAppBarItem.empty(),
              CustomBottomAppBarItem(
                label: "wallet",
                primaryIcon: Icons.account_balance_wallet,
                secondaryIcon: Icons.account_balance_wallet_outlined,
                onPressed: () => pageController.jumpToPage(
                  2,
                ),
              ),
              CustomBottomAppBarItem(
                label: "profile",
                primaryIcon: Icons.person,
                secondaryIcon: Icons.person_outlined,
                onPressed: () => pageController.jumpToPage(
                  3,
                ),
              ),
            ],));
  }
}
