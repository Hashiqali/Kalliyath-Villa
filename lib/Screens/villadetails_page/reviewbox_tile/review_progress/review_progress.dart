import 'package:flutter/material.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

reviewprogress(
    {required Size size,
    required String text,
    required double value,
    required String count}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(text,
            style: apptextstyle(
                color: AppColors.white, size: 17, weight: FontWeight.w200)),
        Container(
          height: size.height / 50,
          width: size.width / 1.5,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(5),
            value: value,
            valueColor: const AlwaysStoppedAnimation<Color>(
                Color.fromARGB(255, 233, 163, 11)),
            backgroundColor: Colors.transparent,
          ),
        ),
        SizedBox(
          height: size.height / 35,
          width: size.width / 9,
          child: Center(
            child: Text(count,
                style: apptextstyle(
                    color: AppColors.white, size: 17, weight: FontWeight.w200)),
          ),
        ),
      ],
    ),
  );
}
