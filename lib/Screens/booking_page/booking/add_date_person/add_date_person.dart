import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/booking_page/bloc/booking_bloc.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/add_date_person/add_tile.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:kalliyath_villa/widget/calendar_widget/calendar_widget.dart';

class BookingPage extends StatefulWidget {
  const BookingPage(
      {super.key,
      required this.details,
      required this.place,
      required this.eventsMap});
  final Map<String, dynamic> details;
  final String place;
  final Map<DateTime, List<dynamic>> eventsMap;
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final BookingBloc counterwidgetbloc1 = BookingBloc();

  @override
  void dispose() {
    startdate = null;
    enddate = null;
    selecteddate = null;
    startingddate = '';
    endingdate = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.black,
        centerTitle: true,
        title: Text('Bookings',
            style: apptextstyle(
                color: AppColors.white, family: 'Kalliyath', size: 20)),
      ),
      body: firstBookingTile(
          eventsMap: widget.eventsMap,
          size: size,
          details: widget.details,
          place: widget.place,
          counterwidgetbloc1: counterwidgetbloc1,
          context: context),
    );
  }
}
