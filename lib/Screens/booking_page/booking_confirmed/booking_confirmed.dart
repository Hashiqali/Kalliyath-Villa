import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/main_screen/mainscreen.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

class BookingConfirmedPage extends StatelessWidget {
  const BookingConfirmedPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: SizedBox(
          height: size.height / 3,
          width: size.width / 1.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 55,
                backgroundColor: Color.fromARGB(255, 43, 174, 4),
                child: Icon(
                  Icons.done_outlined,
                  color: AppColors.black,
                  size: 60,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text('Booking Confirmed',
                    style: apptextstyle(color: AppColors.white, size: 20)),
              ),
           
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      (MaterialPageRoute(builder: (ctx) => const ManiScreen())),
                      (route) => false);
                },
                child: Text('Return to Home',
                    style: apptextstyle(color: AppColors.white, size: 12)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
