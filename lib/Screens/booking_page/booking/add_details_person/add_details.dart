import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/add_date_person/add_tile.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/add_details_person/add_details_tile.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:kalliyath_villa/widget/calendar_widget/calendar_widget.dart';

class BookingSecondPage extends StatefulWidget {
  const BookingSecondPage(
      {super.key,
      required this.bookingdatas,
      required this.details,
      required this.place});
  final Map<String, Object?> bookingdatas;
  final Map<String, dynamic> details;
  final String place;
  @override
  State<BookingSecondPage> createState() => _BookingSecondPageState();
}

class _BookingSecondPageState extends State<BookingSecondPage> {
  final FocusNode _focusNode = FocusNode();
  GlobalKey<FormState> keybooking = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController pincodecontroller = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 1));

      FocusScope.of(context).requestFocus(_focusNode);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Bookings',
          style: apptextstyle(
            color: AppColors.white,
            size: 20,
            family: 'Kalliyath',
          ),
        ),
      ),
      body: secondBookingTile(
          details: widget.details,
          place: widget.place,
          context: context,
          addresscontroller: addresscontroller,
          namecontroller: namecontroller,
          phonecontroller: phonecontroller,
          pincodecontroller: pincodecontroller,
          key: keybooking,
          size: size,
          focusNode: _focusNode,
          bookingdetails: widget.bookingdatas),
    );
  }
}
