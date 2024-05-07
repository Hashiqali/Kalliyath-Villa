import 'package:flutter/material.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

detailsTile({required String text}) {
  return Text(text, style: apptextstyle(color: AppColors.white, size: 12));
}
