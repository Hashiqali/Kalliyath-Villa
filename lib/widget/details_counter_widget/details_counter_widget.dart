import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/booking_page/bloc/booking_bloc.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/add_date_person/add_tile.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:kalliyath_villa/widget/snackbar_widget/snackbar.dart';

Widget detailscounterWidget(
    {required Size size,
    required int value,
    required BookingBloc bloc,
    required String name,
    required int villabhk,
    required Function ontap,
    required BuildContext context}) {
  int limitperson = (((villabhk) * 3) - 1);

  String notetext = '';

  value = value;
  notetext = 'Age 13+';
  if (name == 'Childrens') {
    notetext = 'Age 2-12';
  } else if (name == 'Infants') {
    notetext = 'Under 2';
  }

  void incrementCounter() {
    if (name == 'Adults' || name == 'Childrens') {
      if (adult + childrens <= limitperson) {
        value++;
        ontap(value);

        bloc.add(DetailsCounterBuilder());
      } else {
        snackbarAlert(context, 'Limit over');
      }
    } else {
      value++;
      ontap(value);

      bloc.add(DetailsCounterBuilder());
    }
  }

  void decrementCounter() {
    if (name == 'Adults') {
      if (value > 1) {
        value--;
        ontap(value);
        bloc.add(DetailsCounterBuilder());
      }
    } else {
      if (value > 0) {
        value--;
        ontap(value);

        bloc.add(DetailsCounterBuilder());
      }
    }
  }

  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            style: apptextstyle(color: AppColors.white, size: 16),
            children: [
              TextSpan(
                text: name,
              ),
              if (name != 'Extra person')
                TextSpan(
                    text: '   ($notetext)',
                    style: apptextstyle(color: AppColors.white, size: 12))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: AppColors.white,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        size: 18,
                        Icons.remove,
                        color: AppColors.black,
                      ),
                      onPressed: decrementCounter,
                    ),
                  ),
                ),
              ),
              BlocBuilder<BookingBloc, BookingState>(
                bloc: bloc,
                builder: (context, state) {
                  return SizedBox(
                    height: size.height / 25,
                    width: size.width / 9,
                    child: Center(
                      child: Text('$value',
                          style:
                              apptextstyle(color: AppColors.white, size: 17)),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: AppColors.white,
                  child: IconButton(
                    icon: const Icon(
                      size: 18,
                      Icons.add,
                      color: AppColors.black,
                    ),
                    onPressed: incrementCounter,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
