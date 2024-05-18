import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/Booking_details/user_details_box/price_tile/price_tile.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

priceBox(
    {required Size size,
    required Map<String, dynamic> details,
    required Map<String, Object?> bookingdetails,
    required int days}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      width: size.width,
      height: size.height / 5.5,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price',
                style: apptextstyle(
                    color: AppColors.white,
                    size: size.width / 28,
                    weight: FontWeight.w600)),
            priceTile(
                heading: 'Villa price',
                value: '₹ ${int.parse(details['price'])}',
                size: size.width / 35),
            priceTile(
                heading:
                    'Extrapersons (${bookingdetails['extraperson']}X ${details['perperson']})',
                size: size.width / 35,
                value:
                    '₹ ${(int.parse(bookingdetails['extraperson'].toString()) * int.parse(details['perperson']))}'),
            priceTile(
                heading:
                    'Per night ($days X ${int.parse(details['price']) + (int.parse(bookingdetails['extraperson'].toString()) * int.parse(details['perperson']))})',
                size: size.width / 35,
                value:
                    '₹ ${days * int.parse(details['price']) + (int.parse(bookingdetails['extraperson'].toString()) * int.parse(details['perperson']))}'),
            priceTile(
                heading: 'Taxes',
                size: size.width / 35,
                value:
                    '₹ ${(int.parse(details['price']) - (int.parse(details['price']) / 1.1).round())}'),
            priceTile(
                heading: 'Total amount',
                value:
                    '₹ ${(int.parse(details['price']) - (int.parse(details['price']) / 1.1).round()) + (days * int.parse(details['price']) + (int.parse(bookingdetails['extraperson'].toString()) * int.parse(details['perperson'])))}',
                size: size.width / 30,
                weight: FontWeight.w600)
          ],
        ),
      ),
    ),
  );
}
