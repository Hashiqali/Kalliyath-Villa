import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/authentication/authentication.dart';

Widget googleButton({context, size, bool? istrue}) {
  Color myColor = const Color.fromARGB(87, 101, 71, 24);
  return istrue == true
      ? Column(
          children: [
            const Center(
              child: Text(
                'Or Signup with',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Kalliyath1',
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: size.height / 50,
            ),
            Center(
              child: Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(15),
                color: Colors.transparent,
                child: InkWell(
                  splashColor: const Color.fromARGB(121, 129, 128, 128),
                  onTap: () {
                    googleSigning(context);
                  },
                  child: Container(
                    height: size.height / 15,
                    width: size.width / 4,
                    decoration: BoxDecoration(
                      color: myColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                        child: Image(
                            height: 30,
                            width: 30,
                            image: AssetImage('assets/images/google.png'))),
                  ),
                ),
              ),
            ),
          ],
        )
      : Column(
          children: [
            const Center(
              child: Text(
                'Or login with',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Kalliyath1',
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: size.height / 50,
            ),
            Center(
              child: Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(15),
                color: Colors.transparent,
                child: InkWell(
                  splashColor: const Color.fromARGB(121, 129, 128, 128),
                  onTap: () {
                    googlelogin(context);
                  },
                  child: Container(
                    height: size.height / 15,
                    width: size.width / 4,
                    decoration: BoxDecoration(
                      color: myColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                        child: Image(
                            height: 30,
                            width: 30,
                            image: AssetImage('assets/images/google.png'))),
                  ),
                ),
              ),
            ),
          ],
        );
}
