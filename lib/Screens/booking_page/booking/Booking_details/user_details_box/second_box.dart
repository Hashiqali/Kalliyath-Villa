import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/booking_page/bloc/booking_bloc.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/Booking_details/functions.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/Booking_details/user_details_box/details_tile/details_box.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/Booking_details/user_details_box/price_tile/price_box.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

secondBox(
    {required Size size,
    required Map<String, dynamic> details,
    required BuildContext context,
    required Map<String, Object?> bookingdetails,
    required String place,
    required int days}) {
  BookingBloc bookingbuttonbloc = BookingBloc();
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(10)),
      height: size.height / 1.9,
      width: size.width,
      child: Column(
        children: [
          detailsBox(size: size, bookingdetails: bookingdetails),
          priceBox(
              size: size,
              details: details,
              bookingdetails: bookingdetails,
              days: days),
          GestureDetector(
            onTap: () {
              bookingbuttonbloc.add(BookNowLoaderEvent());
              
            
             
              booknow(
                  bookingbuttonbloc: bookingbuttonbloc,
                  context: context,
                  details: details,
                  bookingdetails: bookingdetails,
                  pricedetails: {
                    'extraperson':
                        (int.parse(bookingdetails['extraperson'].toString()) *
                            int.parse(details['perperson'])),
                    'pernight': (days * int.parse(details['price']) +
                        (int.parse(bookingdetails['extraperson'].toString()) *
                            int.parse(details['perperson']))),
                    'taxes': (int.parse(details['price']) -
                        (int.parse(details['price']) / 1.1).round()),
                    'totalamount': (int.parse(details['price']) -
                            (int.parse(details['price']) / 1.1).round()) +
                        (days * int.parse(details['price']) +
                            (int.parse(
                                    bookingdetails['extraperson'].toString()) *
                                int.parse(details['perperson'])))
                  },
                  days: days,
                  place: place,
                  checkin: bookingdetails['startingdate'].toString(),
                  checkout: bookingdetails['endingdate'].toString());
            },
            child: BlocBuilder<BookingBloc, BookingState>(
              bloc: bookingbuttonbloc,
              builder: (context, state) {
                bool istrue = false;
                if (state is BookNowLoaderOnstate) {
                  istrue = true;
                } else if (state is BookNowLoaderOffstate) {
                  istrue = false;
                }
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 10, right: 10),
                  child: Center(
                    child: Container(
                      height: size.height / 15,
                      decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      width: size.width / 1.1,
                      child: Center(
                        child: istrue == true
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: AppColors.white,
                              ))
                            : Text('Book Now',
                                style: apptextstyle(
                                    color: AppColors.white,
                                    size: 17,
                                    family: 'Kaliiyath',
                                    weight: FontWeight.w500)),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ),
  );
}
