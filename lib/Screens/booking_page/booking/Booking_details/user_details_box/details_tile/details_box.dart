import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/Booking_details/user_details_box/details_tile/details_tile.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

detailsBox({required Size size, required Map<String, Object?> bookingdetails}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      width: size.width,
      height: size.height / 6.5,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.blue),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Details',
              style: apptextstyle(
                  color: AppColors.white, size: 13, weight: FontWeight.w600),
            ),
            detailsTile(text: 'Name : ${bookingdetails['name']}'),
            detailsTile(
                text: 'Phone Number : ${bookingdetails['phonenumber']}'),
            detailsTile(
                text:
                    'Address : ${bookingdetails['address']},${bookingdetails['pincode']}, ${bookingdetails['city']},${bookingdetails['state']},${bookingdetails['country'].toString().substring(4, bookingdetails['country'].toString().length).trim()}')
          ],
        ),
      ),
    ),
  );
}
