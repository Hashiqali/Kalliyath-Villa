import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/booking_page/bloc/booking_bloc.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/Booking_details/book_now.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/add_date_person/add_tile.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking_confirmed/booking_confirmed.dart';
import 'package:kalliyath_villa/firebase/user.dart';
import 'package:kalliyath_villa/widget/razorpay_widget/razorpay_widget.dart';
import 'package:kalliyath_villa/widget/snackbar_widget/snackbar.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

int dayscount(int starting, int ending) {
  int c = 0;
  for (int i = starting; i < ending; i++) {
    c++;
  }
  return c;
}

initialcount(Map<String, Object?> bookingdetails) {
  int days = dayscount(
      int.parse(DateTime.parse(bookingdetails['startingdate'].toString())
          .day
          .toString()),
      int.parse(DateTime.parse(bookingdetails['endingdate'].toString())
          .day
          .toString()));
  return days;
}

booknow(
    {required final Map<String, dynamic> details,
    required BookingBloc bookingbuttonbloc,
    required BuildContext context,
    required Map<String, Object?> bookingdetails,
    required final Map<String, dynamic> pricedetails,
    required int days,
    required String place,
    required String checkin,
    required String checkout}) async {
  await opencheckout(
    amount: pricedetails['totalamount'] * 100,
    villaname: details['name'],
  );

  void handlePaymentSuccess(PaymentSuccessResponse response) async {
    final CollectionReference booking =
        FirebaseFirestore.instance.collection('Bookings');

    final villadata = {
      'name': details['name'],
      'villaid': details['id'],
      'image': details['images'][0],
      'place': '$place,${details['locationadress']['state']}',
      'checkin': checkin,
      'checkout': checkout,
      'adults': bookingdetails['adult'],
      'childrens': bookingdetails['childrens'],
      'infants': bookingdetails['infants'],
      'extraperson': bookingdetails['extraperson'],
    };
    final address = {
      'name': bookingdetails['name'],
      'phonenumber': bookingdetails['phonenumber'],
      'address': bookingdetails['address'],
    };
    final price = {
      'price': details['price'],
      'extraperson': pricedetails['extraperson'],
      'pernight': pricedetails['pernight'],
      'taxes': pricedetails['taxes'],
      'total': pricedetails['totalamount']
    };
    await booking.add({
      'villa': villadata,
      'address': address,
      'price': price,
      'user': appuserid,
      'cancelled': false,
      'refund': false
    });

    await Future.delayed(const Duration(seconds: 2));
    bookingbuttonbloc.add(BookNowLoaderCloseEvent());
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => const BookingConfirmedPage()));
    adult = 1;
    childrens = 0;
    allowpersons = 0;
    infants = 0;
    extrapersons = 0;
  }

  void handlePaymentError(PaymentFailureResponse response) {
    bookingbuttonbloc.add(BookNowLoaderCloseEvent());
    snackbarFail(context, 'Payment failed');
  }

  void handleExternalWallet(ExternalWalletResponse response) async {
    bookingbuttonbloc.add(BookNowLoaderCloseEvent());
    final CollectionReference booking =
        FirebaseFirestore.instance.collection('Bookings');

    final villadata = {
      'name': details['name'],
      'villaid': details['id'],
      'image': details['images'][0],
      'place': '$place,${details['locationadress']['state']}',
      'checkin': checkin,
      'checkout': checkout,
      'adults': bookingdetails['adult'],
      'childrens': bookingdetails['childrens'],
      'infants': bookingdetails['infants'],
      'extraperson': bookingdetails['extraperson'],
    };
    final address = {
      'name': bookingdetails['name'],
      'phonenumber': bookingdetails['phonenumber'],
      'address': bookingdetails['address'],
    };
    final price = {
      'price': details['price'],
      'extraperson': pricedetails['extraperson'],
      'pernight': pricedetails['pernight'],
      'taxes': pricedetails['taxes'],
      'total': pricedetails['totalamount']
    };
    await booking.add({
      'villa': villadata,
      'address': address,
      'price': price,
      'user': appuserid,
      'cancelled': false,
      'refund': false
    });

    await Future.delayed(const Duration(seconds: 2));
    bookingbuttonbloc.add(BookNowLoaderCloseEvent());
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => const BookingConfirmedPage()));
    adult = 1;
    childrens = 0;
    allowpersons = 0;
    infants = 0;
    extrapersons = 0;
  }

  razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
  razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
  razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
}
