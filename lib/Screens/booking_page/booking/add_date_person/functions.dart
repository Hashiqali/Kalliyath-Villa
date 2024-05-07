import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/add_date_person/add_tile.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/add_details_person/add_details.dart';
import 'package:kalliyath_villa/widget/snackbar_widget/snackbar.dart';

nextbutton(
    {required BuildContext context,
    required String place,
    required Map<String, dynamic> details}) {
  Map<String, Object?> data = {
    'startingdate': startdate,
    'endingdate': enddate,
    'adult': adult,
    'childrens': childrens,
    'infants': infants,
    'extraperson': extrapersons
  };
  if (startdate == null) {
    snackbarAlert(context, 'Please select starting date');
  } else if (enddate == null) {
    snackbarAlert(context, 'Please select ending date');
  } else if (startdate == null && enddate == null) {
    snackbarAlert(context, 'Please select starting and ending date');
  } else {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => BookingSecondPage(
              details: details,
              place: place,
              bookingdatas: data,
            )));
  }
}
