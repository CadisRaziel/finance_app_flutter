import 'package:finance/core/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final Color? color;

  const CustomCircularProgressIndicator({ super.key, this.color });

   @override
   Widget build(BuildContext context) {
       return Center(
         child:  CircularProgressIndicator(
          color: color ?? AppColors.white,
         ),
       );
  }
}