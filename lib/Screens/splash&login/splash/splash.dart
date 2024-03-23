import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splashtime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color.fromARGB(87, 101, 71, 24);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.20),
                  BlendMode.saturation,
                ),
                image: AssetImage('assets/images/Modern House Design.jpeg'))),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: myColor, borderRadius: BorderRadius.circular(20)),
              height: size.height / 3.5,
              width: size.width,
              child: Column(
                children: [
                  SizedBox(height: size.height / 35),
                  const Image(
                      filterQuality: FilterQuality.high,
                      image: AssetImage('assets/images/logo.png')),
                  SizedBox(height: size.height / 80),
                  const Image(
                      filterQuality: FilterQuality.high,
                      image: AssetImage('assets/images/Group 31.png')),
                  // const Text(
                  //   'KALLIYATH',
                  //   style: TextStyle(
                  //       color: Colors.white,
                  //       fontFamily: 'Kalliyath',
                  //       fontWeight: FontWeight.w500,
                  //       fontSize: 45),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  splashtime() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginPage()));
  }
}
