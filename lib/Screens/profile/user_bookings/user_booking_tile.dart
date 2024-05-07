import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/cancel_booking/bloc/cancel_bloc.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/cancel_booking/cancel_booking.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/functions.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/user_booking_details/user_booking_detail/user_booking_details.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/user_booking_tab_bar/user_booking_tabbar.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
 CancelBloc bookingsbuild = CancelBloc();
userBookingTile({required Size size, required Booking value}) {
 
  return BlocBuilder<CancelBloc, CancelState>(
    bloc: bookingsbuild,
    builder: (context, state) {
      return Container(
        height: size.height,
        width: size.width,
        color: AppColors.black,
        child: FutureBuilder<List>(
          future: getUserbookings(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: SizedBox(
                height: 55,
                width: 55,
                child: CircularProgressIndicator(
                  color: AppColors.white,
                ),
              ));
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final datas = snapshot.data ?? [];
              List userbookings = [];
              if (value == Booking.active) {
                userbookings = filteruserbookings(datas);
              } else if (value == Booking.past) {
                userbookings = filteruserbookingsPast(datas);
              } else if (value == Booking.cancelled) {
                userbookings = filteruserbookingsCancelled(datas);
              }
              return userbookings.isEmpty
                  ? Center(
                      child: Text(
                        'No Bookings',
                        style: apptextstyle(color: AppColors.white, size: 15),
                      ),
                    )
                  : ListView.builder(
                      itemCount: userbookings.length,
                      itemBuilder: (ctx, index) {
                        final bookings = userbookings[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: size.height / 4,
                            width: size.width,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 38, 38, 38),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 7, right: 7),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: size.height / 6,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      bookings['villa']
                                                          ['image']))),
                                          width: size.width / 2.5,
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          width: size.width / 1.9,
                                          height: size.height / 6,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Check-in',
                                                      style: apptextstyle(
                                                          color: AppColors
                                                              .lightgreen,
                                                          weight:
                                                              FontWeight.w600,
                                                          size: 17),
                                                    ),
                                                    Text(
                                                      DateFormat.yMMMMd()
                                                          .format(DateTime
                                                              .parse(bookings[
                                                                      'villa']
                                                                  ['checkin'])),
                                                      style: apptextstyle(
                                                          weight:
                                                              FontWeight.w200,
                                                          color:
                                                              AppColors.white,
                                                          size: 13),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Check-out',
                                                      style: apptextstyle(
                                                          color: AppColors.red,
                                                          weight:
                                                              FontWeight.w600,
                                                          size: 17),
                                                    ),
                                                    Text(
                                                      DateFormat.yMMMMd()
                                                          .format(DateTime
                                                              .parse(bookings[
                                                                      'villa'][
                                                                  'checkout'])),
                                                      style: apptextstyle(
                                                          weight:
                                                              FontWeight.w200,
                                                          color:
                                                              AppColors.white,
                                                          size: 13),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'Total Amount : ₹${bookings['price']['total']}',
                                                  style: apptextstyle(
                                                      color: AppColors.white,
                                                      size: 13,
                                                      weight: FontWeight.w900),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height / 15,
                                  width: size.width / 1.1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          UserBookingDetails(
                                                            bookings: bookings,
                                                          )));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Center(
                                                child: Container(
                                                  height: size.height / 16,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              169, 28, 83, 246),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  width: size.width / 1.1,
                                                  child: Center(
                                                    child: Text('View Details',
                                                        style: apptextstyle(
                                                            color:
                                                                AppColors.white,
                                                            size: 14,
                                                            family:
                                                                'Kalliyath2',
                                                            weight: FontWeight
                                                                .w500)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        value != Booking.past &&
                                                value != Booking.cancelled
                                            ? Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (ctx) =>
                                                                CancelBookingPage(
                                                                  id: bookings
                                                                      .id,
                                                                )));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: Center(
                                                      child: Container(
                                                        height:
                                                            size.height / 16,
                                                        decoration: BoxDecoration(
                                                            color: const Color
                                                                .fromARGB(169,
                                                                255, 17, 0),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        width: size.width / 1.1,
                                                        child: Center(
                                                          child: Text(
                                                              'Cancel Booking',
                                                              style: apptextstyle(
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                  size: 14,
                                                                  family:
                                                                      'Kalliyath2',
                                                                  weight:
                                                                      FontWeight
                                                                          .w500)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : const SizedBox()
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
            }
          },
        ),
      );
    },
  );
}
