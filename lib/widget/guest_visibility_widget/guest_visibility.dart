import 'package:flutter/material.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

guestVisibility(
    {required bool visibility, required String text, double appsize = 12}) {
  return Visibility(
    visible: visibility,
    child: Text(text,
        style: apptextstyle(
            color: AppColors.white, size: appsize, weight: FontWeight.w600)),
  );
}
