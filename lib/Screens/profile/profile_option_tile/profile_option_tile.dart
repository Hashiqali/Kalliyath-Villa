import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/login/login.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/firebase/get_functions.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class ProfieOption extends StatelessWidget {
  ProfieOption(
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
      color: AppColors.darkblue,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        splashColor: const Color.fromARGB(121, 32, 32, 32),
        onTap: () {
          istrue == true
              ? showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: const Color.fromARGB(255, 22, 22, 22),
                      content: Text('Are you sure to logout?',
                          style:
                              apptextstyle(color: AppColors.white, size: 15)),
                      actions: [
                        TextButton(
                            onPressed: () {
                              logout(context);
                            },
                            child: Text(
                              'Yes',
                              style: apptextstyle(
                                  color: AppColors.white, size: 15),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text(
                              'No',
                              style: apptextstyle(
                                  color: AppColors.white, size: 15),
                            )),
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
                    color: istrue ? AppColors.red : AppColors.white,
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
    Navigator.of(context).pushAndRemoveUntil(
        (MaterialPageRoute(builder: (ctx) => const LoginPage())),
        (route) => false);
  }
}
