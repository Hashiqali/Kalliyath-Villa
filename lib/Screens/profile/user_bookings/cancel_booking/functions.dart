import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/cancel_booking/bloc/cancel_bloc.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/user_booking_tile.dart';
import 'package:kalliyath_villa/widget/snackbar_widget/snackbar.dart';

proceedfunction(
    {required bool textfield,
    required bool is6thReasonSelected,
    required bool isReasonSelected,
    required CancelBloc button,
    required GlobalKey<FormState> key,
    required BuildContext context,
    required String id,
    required TextEditingController text,
    required String reason}) async {
  final CollectionReference booking =
      FirebaseFirestore.instance.collection('Bookings');

  if (is6thReasonSelected) {
    if (key.currentState!.validate()) {
      button.add(ProceedButton());
      await booking.doc(id).update(
          {'reason': text.text.trim(), 'cancelled': true, 'status': true});
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pop(context);
      text.text = '';
    }
  } else if (isReasonSelected) {
    button.add(ProceedButton());

    await booking
        .doc(id)
        .update({'reason': reason, 'cancelled': true, 'status': true});

    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
  } else {
    snackbarAlert(context, 'Please select at least one reason');
  }
  bookingsbuild.add(Userbookingbuild());
}

bool isAnyReasonSelected(CancelState state) {
  if (state is BookingOptionState1 ||
      state is BookingOptionState2 ||
      state is BookingOptionState3 ||
      state is BookingOptionState4 ||
      state is BookingOptionState5 ||
      state is BookingOptionState6) {
    return true;
  }
  return false;
}

bool is6ReasonSelected(CancelState state) {
  if (state is BookingOptionState6) {
    return true;
  }
  return false;
}
