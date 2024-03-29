import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfieTile extends StatelessWidget {
  ProfieTile(
      {super.key,
      required this.function,
      required this.image,
      required this.size,
      required this.text,
      required this.istrue});
  String image;
  String text;
  Size size;
  bool istrue;
  Function function;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 1, 10, 19),
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        splashColor: const Color.fromARGB(121, 32, 32, 32),
        onTap: () {
          function();
        },
        child: SizedBox(
          height: size.height / 17,
          child: Row(
            children: [
              SizedBox(
                width: size.width / 35,
              ),
              Image(height: 27, image: AssetImage(image)),
              SizedBox(
                width: size.width / 35,
              ),
              Text(
                text,
                style: TextStyle(
                    color: istrue
                        ? Colors.red
                        : const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontFamily: 'Kalliyath2',
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
