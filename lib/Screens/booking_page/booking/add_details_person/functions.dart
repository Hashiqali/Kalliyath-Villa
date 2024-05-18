import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/Booking_details/book_now.dart';
import 'package:kalliyath_villa/widget/snackbar_widget/snackbar.dart';

confirmbooking(
    {required Map<String, Object?> bookingdetails,
    required BuildContext context,
    required TextEditingController namecontroller,
    required Map<String, dynamic> details,
    required String place,
    required String countryCode,
    required TextEditingController phonecontroller,
    required TextEditingController addresscontroller,
    required TextEditingController pincodecontroller,
    required String countryvalue,
    required String statevalue,
    required String cityvalue,
    required GlobalKey<FormState> key}) {
  if (key.currentState!.validate()) {
    if (phonecontroller.text == '') {
      snackbarAlert(context, 'Please add phone Number');
    } else if (countryvalue == '') {
      snackbarAlert(context, 'Please select country');
    } else if (statevalue == '') {
      snackbarAlert(context, 'Please select state');
    } else if (cityvalue == '') {
      snackbarAlert(context, 'Please select city');
    } else {
      final data = {
        'startingdate': bookingdetails['startingdate'],
        'endingdate': bookingdetails['endingdate'],
        'adult': bookingdetails['adult'],
        'childrens': bookingdetails['childrens'],
        'infants': bookingdetails['infants'],
        'extraperson': bookingdetails['extraperson'],
        'name': namecontroller.text.trim(),
        'phonenumber': '+${countryCode + phonecontroller.text.trim()}',
        'address': addresscontroller.text.trim(),
        'country': countryvalue,
        'state': statevalue,
        'city': cityvalue,
        'pincode': pincodecontroller.text.trim()
      };
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => BookNowPage(
                details: details,
                place: place,
                bookingdetails: data,
              )));
    }
  } else {
    snackbarAlert(context, 'Please fill the form');
  }
}
