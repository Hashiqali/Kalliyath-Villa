import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/add_details_person/add_details_tile.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

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
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  GlobalKey<FormState> keybooking = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController pincodecontroller = TextEditingController();

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
          focusNode1: focusNode1,
          focusNode2: focusNode2,
          focusNode3: focusNode3,
          focusNode4: focusNode4,
          bookingdetails: widget.bookingdatas),
    );
  }
}
