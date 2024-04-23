import 'package:flutter/material.dart';

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
        Text(
          text,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 17,
            fontFamily: 'Kalliyath2',
            fontWeight: FontWeight.w200,
          ),
        ),
        Container(
          height: size.height / 50,
          width: size.width / 1.5,
          decoration: BoxDecoration(
            color: Colors.white,
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
        Text(
          count,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 17,
            fontFamily: 'Kalliyath2',
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    ),
  );
}
