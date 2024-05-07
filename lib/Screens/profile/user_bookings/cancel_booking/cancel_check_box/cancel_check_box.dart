import 'package:flutter/material.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

cancelCheckBox({required String text, required Function ontap,required bool value}) {
  return CheckboxListTile(
    title: Text(text,
        style: apptextstyle(
            color: AppColors.white, size: 13, family: 'Kalliyath')),
    activeColor: AppColors.white,
    checkColor: AppColors.black,
    value: value,
    onChanged: (value) {
      ontap(value);
    },
  );
}
