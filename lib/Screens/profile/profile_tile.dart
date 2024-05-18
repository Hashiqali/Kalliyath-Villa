import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/about/about.dart';
import 'package:kalliyath_villa/Screens/chat_screen/chat_screen.dart';
import 'package:kalliyath_villa/Screens/privacy_policy/privacy_policy.dart';
import 'package:kalliyath_villa/Screens/profile/profile_option_tile/profile_option_tile.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/user_bookings.dart';
import 'package:kalliyath_villa/Screens/terms_and_conditions/terms_and_conditions.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/Screens/profile/personal_infromation/personal_infromation.dart';

profileTile({required Size size, required BuildContext context}) {
  return SingleChildScrollView(
    child: Container(
      height: size.height / 1.4,
      width: size.width,
      color: AppColors.darkblue,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ProfieOption(
                function: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const PersonalInfromation()));
                },
                image: 'assets/images/user (1).png',
                size: size,
                text: 'Personal Information',
                istrue: false),
            ProfieOption(
                function: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const UserBookingsPage()));
                },
                image: 'assets/images/luggage.png',
                size: size,
                text: 'Bookings',
                istrue: false),
            ProfieOption(
                function: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const ChatScreenPage()));
                },
                image: 'assets/images/question.png',
                size: size,
                text: 'Customer Support',
                istrue: false),
            ProfieOption(
                function: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const PrivacyPolicy()));
                },
                image: 'assets/images/privacy-policy.png',
                size: size,
                text: 'Privacy and Policy',
                istrue: false),
            ProfieOption(
                function: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const TermsAndConditions()));
                },
                image: 'assets/images/terms-and-conditions (1).png',
                size: size,
                text: 'Terms and Conditions',
                istrue: false),
            ProfieOption(
                function: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => const About()));
                },
                image: 'assets/images/info.png',
                size: size,
                text: 'About',
                istrue: false),
            ProfieOption(
                function: () {},
                image: 'assets/images/log-out.png',
                size: size,
                text: 'Logout',
                istrue: true),
          ],
        ),
      ),
    ),
  );
}
