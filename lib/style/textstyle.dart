import 'package:flutter/material.dart';

TextStyle apptextstyle(
    {required Color color,
    String family = 'Kalliyath2',
    FontWeight weight = FontWeight.w400,
    required double size}) {
  return TextStyle(
      color: color,
      fontSize: size,
      fontFamily: family,
      fontWeight: weight,
      overflow: TextOverflow.visible);
}
