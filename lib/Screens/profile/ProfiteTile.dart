import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          istrue == true
              ? showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
                      content: const Text(
                        'Are you sure to logout?',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              logout(context);
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text('No',
                                style: TextStyle(
                                    color:
                                        Color.fromARGB(255, 255, 255, 255)))),
                      ],
                    );
                  })
              : function();
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

  logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('User');
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushAndRemoveUntil(
        (MaterialPageRoute(builder: (ctx) => LoginPage())), (route) => false);
  }
}
