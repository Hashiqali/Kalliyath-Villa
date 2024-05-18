import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/booking_page/bloc/booking_bloc.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:kalliyath_villa/widget/calendar_widget/calendar_widget.dart';

final BookingBloc datebuildbloc = BookingBloc();
Widget datewidget(
    {required Size size,
    required DateTime startdate,
    required DateTime enddate}) {
  return BlocBuilder<BookingBloc, BookingState>(
    bloc: datebuildbloc,
    builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text('Starting date',
                  style: apptextstyle(
                      color: AppColors.white,
                      size: 14,
                      family: 'Kalliyath',
                      weight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  height: size.height / 20,
                  width: size.width / 3,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(startingddate,
                        style: apptextstyle(
                            color: AppColors.white,
                            size: 12,
                            family: 'Kalliyath',
                            weight: FontWeight.w500)),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text('Ending date',
                  style: apptextstyle(
                      color: AppColors.white,
                      size: 14,
                      family: 'Kalliyath',
                      weight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  height: size.height / 20,
                  width: size.width / 3,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(endingdate,
                        style: apptextstyle(
                            color: AppColors.white,
                            size: 12,
                            family: 'Kalliyath',
                            weight: FontWeight.w500)),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}
