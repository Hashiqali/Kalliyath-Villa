import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:kalliyath_villa/widget/guest_visibility_widget/guest_visibility.dart';

firstBox(
    {required Size size,
    required Map<String, Object?> bookingdetails,
    required Map<String, dynamic> details,
    required String place}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
    child: Container(
      height: size.height / 3.7,
      width: size.width,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(details['name'],
                    style: apptextstyle(
                        color: AppColors.white, size: size.width / 17)),
                Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(41, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    height: size.height / 35,
                    width: size.width / 12,
                    child: Center(
                      child: Text(
                          details['totalstar'].toString() == '0'
                              ? '0.0'
                              : details['totalstar'].toString().substring(0, 3),
                          style: apptextstyle(
                              color: AppColors.white, size: size.width / 40)),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              '$place, ${details['locationadress']['state']}',
              style:
                  apptextstyle(color: AppColors.white, size: size.width / 30),
            ),
            const Divider(
              thickness: 1,
              color: AppColors.white,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(size.width / 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Check-in (11:00 AM)',
                          style: apptextstyle(
                              color: AppColors.white, size: size.width / 35),
                        ),
                        Text(
                          DateFormat.yMMMMd().format(DateTime.parse(
                              bookingdetails['startingdate'].toString())),
                          style: apptextstyle(
                              color: AppColors.white, size: size.width / 30),
                        ),
                      ],
                    ),
                  )),
                  const VerticalDivider(
                    thickness: 1,
                    color: AppColors.white,
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(size.width / 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Check-out (10:00 AM)',
                          style: apptextstyle(
                              color: AppColors.white, size: size.width / 35),
                        ),
                        Text(
                          DateFormat.yMMMMd().format(DateTime.parse(
                              bookingdetails['endingdate'].toString())),
                          style: apptextstyle(
                              color: AppColors.white, size: size.width / 30),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: AppColors.white,
            ),
            SizedBox(
              height: size.height / 18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Guests',
                    style: apptextstyle(
                        color: AppColors.white, size: size.width / 30),
                  ),
                  Row(
                    children: [
                      guestVisibility(
                          appsize: size.width / 30,
                          visibility: true,
                          text: 'Adults : ${bookingdetails['adult']}'),
                      guestVisibility(
                          appsize: size.width / 30,
                          visibility: bookingdetails['childrens'] != 0,
                          text:
                              ' , Childrens : ${bookingdetails['childrens']}'),
                      guestVisibility(
                          appsize: size.width / 30,
                          visibility: bookingdetails['infants'] != 0,
                          text: ' , Infants : ${bookingdetails['infants']}'),
                      guestVisibility(
                          appsize: size.width / 30,
                          visibility: bookingdetails['extraperson'] != 0,
                          text:
                              ' , Extraperson : ${bookingdetails['extraperson']}')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
