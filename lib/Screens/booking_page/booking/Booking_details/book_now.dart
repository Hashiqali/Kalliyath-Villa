import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/Booking_details/villa_details_box/villa_details_tile.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/Booking_details/functions.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/Booking_details/user_details_box/second_box.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BookNowPage extends StatefulWidget {
  const BookNowPage(
      {super.key,
      required this.bookingdetails,
      required this.details,
      required this.place});
  final Map<String, Object?> bookingdetails;
  final Map<String, dynamic> details;
  final String place;

  @override
  State<BookNowPage> createState() => _BookNowPageState();
}

final razorpay = Razorpay();

class _BookNowPageState extends State<BookNowPage> {
  int days = 0;
  @override
  void initState() {
    days = initialcount(widget.bookingdetails);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.black,
        centerTitle: true,
        title: Text(
          'Confirm Booking',
          style: apptextstyle(
              color: AppColors.white, size: 20, family: 'Kalliyath'),
        ),
      ),
      body: Container(
        color: AppColors.black,
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            firstBox(
                size: size,
                bookingdetails: widget.bookingdetails,
                details: widget.details,
                place: widget.place),
            secondBox(
                place: widget.place,
                context: context,
                size: size,
                details: widget.details,
                bookingdetails: widget.bookingdetails,
                days: days)
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }
}
