import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/booking_page/bloc/booking_bloc.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/add_date_person/functions.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:kalliyath_villa/widget/details_counter_widget/details_counter_widget.dart';
import 'package:kalliyath_villa/widget/calendar_widget/calendar_widget.dart';
import 'package:kalliyath_villa/widget/calendar_widget/date_widget.dart';

DateTime? startdate;
DateTime? enddate;
int adult = 1;
int childrens = 0;
int allowpersons = 0;
int infants = 0;
int extrapersons = 0;

firstBookingTile(
    {required Size size,
    required Map<String, dynamic> details,
    required String place,
    required BookingBloc counterwidgetbloc1,
    required Map<DateTime, List<dynamic>> eventsMap,
    required BuildContext context}) {
  BookingBloc dateshow = BookingBloc();
  return SingleChildScrollView(
    child: Container(
      color: AppColors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 10, bottom: 15, top: 20),
            child: Row(
              children: [
                Container(
                  height: size.height / 7,
                  width: size.width / 2.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(details['images'].first)),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Center(
                      child: Text(
                        '${details['name']}, $place, ${details['locationadress']['state']}',
                        style: apptextstyle(
                            color: AppColors.white,
                            size: 17,
                            family: 'Kalliyath'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: AppColors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 10),
            child: Text(
              'Date & guest',
              style: apptextstyle(
                  color: AppColors.white,
                  size: 17,
                  family: 'Kalliyath',
                  weight: FontWeight.w600),
            ),
          ),
          CalendarWidget(
            dateshow: dateshow,
            eventsMap: eventsMap,
          ),
          BlocBuilder<BookingBloc, BookingState>(
            bloc: dateshow,
            builder: (context, state) {
              bool visibledates = false;
              if (state is BookingDateShowState) {
                print('hello');
                visibledates = true;
              }
              print('builded');
              return Visibility(
                visible: visibledates,
                child: datewidget(
                    size: size,
                    startdate: startdate == null ? DateTime.now() : startdate!,
                    enddate: enddate == null ? DateTime.now() : enddate!),
              );
            },
          ),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(221, 255, 255, 255),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Please note: ',
                    style: apptextstyle(
                        color: AppColors.red,
                        size: 12,
                        family: 'Kalliyath',
                        weight: FontWeight.w600),
                  ),
                  TextSpan(
                    text:
                        ' Our ${details['bhk']} BHK villa booking allows for ${3 * int.parse(details['bhk'])} persons (including childrens). If you wish to add more persons, there will be an additional charge of ${details['perperson']} rupees per person',
                    style: apptextstyle(
                        color: AppColors.white,
                        size: 11,
                        family: 'Kalliyath',
                        weight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          detailscounterWidget(
            context: context,
            ontap: (value) {
              adult = value;
            },
            size: size,
            value: adult,
            bloc: counterwidgetbloc1,
            name: 'Adults',
            villabhk: int.parse(details['bhk']),
          ),
          detailscounterWidget(
              context: context,
              ontap: (value) {
                childrens = value;
              },
              size: size,
              value: childrens,
              bloc: counterwidgetbloc1,
              villabhk: int.parse(details['bhk']),
              name: 'Childrens'),
          detailscounterWidget(
              context: context,
              ontap: (value) {
                infants = value;
              },
              size: size,
              value: infants,
              bloc: counterwidgetbloc1,
              villabhk: int.parse(details['bhk']),
              name: 'Infants'),
          detailscounterWidget(
              context: context,
              ontap: (value) {
                extrapersons = value;
              },
              size: size,
              value: extrapersons,
              bloc: counterwidgetbloc1,
              villabhk: int.parse(details['bhk']),
              name: 'Extra person'),
          GestureDetector(
            onTap: () {
              nextbutton(context: context, details: details, place: place);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                child: Container(
                  height: size.height / 15,
                  decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  width: size.width / 1.1,
                  child: Center(
                    child: Text(
                      'Next',
                      style: apptextstyle(
                          color: AppColors.white,
                          size: 17,
                          family: 'Kalliyath',
                          weight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
