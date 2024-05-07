import 'package:flutter/material.dart';

import 'package:kalliyath_villa/Screens/profile/user_bookings/user_booking_tile.dart';

userTabBar({required tabController, required Size size}) {
  return TabBarView(
    controller: tabController,
    children: [
      userBookingTile(size: size, value: Booking.active),
      userBookingTile(size: size, value: Booking.past),
      userBookingTile(size: size, value: Booking.cancelled),
    ],
  );
}

enum Booking { active, past, cancelled }
