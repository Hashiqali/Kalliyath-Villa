import 'package:flutter/material.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

priceTile(
    {required String heading,
    required String value,
    double size = 12,
    FontWeight weight = FontWeight.w400}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(heading,
          style:
              apptextstyle(color: AppColors.white, size: size, weight: weight)),
      Text(value.toString(),
          style:
              apptextstyle(color: AppColors.white, size: size, weight: weight)),
    ],
  );
}
