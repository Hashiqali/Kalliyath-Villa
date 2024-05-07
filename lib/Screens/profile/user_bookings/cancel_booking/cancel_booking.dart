import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/cancel_booking/bloc/cancel_bloc.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/cancel_booking/cancel_tile/cancel_tile.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

class CancelBookingPage extends StatefulWidget {
  CancelBookingPage({super.key, required this.id});
  final String id;

  @override
  State<CancelBookingPage> createState() => _CancelBookingPageState();
}

class _CancelBookingPageState extends State<CancelBookingPage> {
  final CancelBloc bloccancel = CancelBloc();

  final CancelBloc blocprivacy = CancelBloc();

  final CancelBloc buttonclick = CancelBloc();

  final TextEditingController reasoncontroller = TextEditingController();

  final GlobalKey<FormState> key1 = GlobalKey<FormState>();
  @override
  void dispose() {
    loading = false;
    textfieldistrue = false;
    isReasonSelected = false;
    is6thReasonSelected = false;
    reason = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.black,
          centerTitle: true,
          title: Text('Cancel Booking',
              style: apptextstyle(
                  color: AppColors.white, family: 'Kalliyath', size: 20)),
        ),
        body: cancelTile(
            size: size,
            bloccancel: bloccancel,
            key1: key1,
            reasoncontroller: reasoncontroller,
            blocprivacy: blocprivacy,
            buttonclick: buttonclick,
            context: context,
            id: widget.id));
  }
}
