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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(color: Color.fromARGB(242, 0, 0, 0)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  color: Color.fromARGB(255, 255, 255, 255),
                  filterQuality: FilterQuality.high,
                  image: AssetImage('assets/images/logo.png')),
              // SizedBox(height: size.height / 80),
              // const Image(
              //     color: Colors.white,
              //     filterQuality: FilterQuality.high,
              //     image: AssetImage('assets/images/Group 31.png')),
              const Text(
                'KALLIYATH',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Kalliyath2',
                    fontWeight: FontWeight.w500,
                    fontSize: 50),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                heightFactor: 0.5,
                widthFactor: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 23),
                  child: Text(
                    'VILLAS',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Kalliyath1',
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 200,
              ),
              const Text(
                'Experience luxury',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Kalliyath2',
                    fontWeight: FontWeight.w100,
                    fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  splashtime() async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginPage()));
  }
}
