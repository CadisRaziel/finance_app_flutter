import 'dart:developer';

import 'package:finance/core/shared/constants/app_colors.dart';
import 'package:finance/core/shared/constants/app_text_style.dart';
import 'package:finance/core/shared/extensions/sizes.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double get textScaleFactor =>
      MediaQuery.of(context).size.width < 360 ? 0.7 : 1.0;
  double get iconSize => MediaQuery.of(context).size.width < 360 ? 16.0 : 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: AppColors.greenGradient,
                  ),
                  borderRadius: BorderRadius.only(
                    //faz uma curva
                    bottomLeft: Radius.elliptical(500, 30),
                    bottomRight: Radius.elliptical(500, 30),
                  )),
              height: 287.h, //-> utilizando nossa classe Size
            ),
          ),
          Positioned(
            left: 24.0,
            right: 24.0,
            top: 74.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Boa tarde,",
                      textScaleFactor: textScaleFactor,
                      style: AppTextStyle.smallText.apply(
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      "Dylan Rieder",
                      textScaleFactor: textScaleFactor,
                      style: AppTextStyle.mediumText.apply(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 8.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    color: AppColors.white.withOpacity(0.1),
                  ),
                  child: Stack(
                      alignment: const AlignmentDirectional(0.5, -0.5),
                      children: [
                        const Icon(
                          Icons.notifications_none_outlined,
                          color: AppColors.white,
                        ),
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            color: AppColors.notification,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        )
                      ]),
                )
              ],
            ),
          ),
          Positioned(
            left: 24.w,
            right: 24.w,
            top: 155.h,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 32.h,
              ),
              decoration: const BoxDecoration(
                color: AppColors.darkGreen,
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Saldo total",
                            textScaleFactor: textScaleFactor,
                            style: AppTextStyle.mediumText16w600.apply(
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            "\$ 1,556.00",
                            textScaleFactor: textScaleFactor,
                            style: AppTextStyle.mediumText30.apply(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => log("options"),
                        child: PopupMenuButton(
                          padding: EdgeInsets.zero,
                          child: const Icon(
                            Icons.more_horiz,
                            color: AppColors.white,
                          ),
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              height: 24.0,
                              child: Text(
                                "Item 1",
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 36.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.06),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  16.0,
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_downward,
                              color: AppColors.white,
                              size: iconSize,
                            ),
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rendimento",
                                textScaleFactor: textScaleFactor,
                                style: AppTextStyle.mediumText16w500
                                    .apply(color: AppColors.white),
                              ),
                              Text(
                                "\$ 1,840.00",
                                textScaleFactor: textScaleFactor,
                                style: AppTextStyle.mediumText20
                                    .apply(color: AppColors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.06),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  16.0,
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_upward,
                              color: AppColors.white,
                              size: iconSize,
                            ),
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Despesas",
                                textScaleFactor: textScaleFactor,
                                style: AppTextStyle.mediumText16w500
                                    .apply(color: AppColors.white),
                              ),
                              Text(
                                "\$ 284.00",
                                textScaleFactor: textScaleFactor,
                                style: AppTextStyle.mediumText20
                                    .apply(color: AppColors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 397.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Histórico de transações",
                        style: AppTextStyle.mediumText18,
                      ),
                      Text(
                        "Ver tudo",
                        style: AppTextStyle.inputHelperText,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        final color = index % 2 == 0
                            ? AppColors.income
                            : AppColors.outcome;
                        final value =
                            index % 2 == 0 ? "+ \$ 100.00" : "- \$ 100.00";
                        return ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                          leading: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.antiFlashWhite,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(Icons.monetization_on_outlined),
                          ),
                          title: const Text(
                            "Trabalho",
                            style: AppTextStyle.mediumText16w500,
                          ),
                          subtitle: const Text(
                            "09-07-2023",
                            style: AppTextStyle.smallText13,
                          ),
                          trailing: Text(
                            value,
                            style:
                                AppTextStyle.mediumText18.apply(color: color),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppCorlos {}
//final _secureStorage = const SecureStorage();
// ElevatedButton(
//           onPressed: () {
//             _secureStorage.deleteOne(key: "CURRENT_USER").then((_) =>
//                 Navigator.of(context).popAndPushNamed(NamedRoute.initial));

//             //quando o flutter reclamar o seguinte 'don't use 'BuildContext' across async gaps.' devemos remover o async await e trabalhr com .then
//             // Navigator.of(context).popAndPushNamed(NamedRoute.initial);
//           },
//           child: Text("Sair"),
//         ),
