import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/booking_page/bloc/booking_bloc.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

String countryvalue = '';
String statevalue = '';
String cityvalue = '';
selectCountryStateCityWidget() {
  BookingBloc pickaddress = BookingBloc();
  return BlocBuilder<BookingBloc, BookingState>(
    bloc: pickaddress,
    builder: (context, state) {
      return SelectState(
        dropdownColor: AppColors.black,
        style: apptextstyle(color: AppColors.white, size: 14),
        onCountryChanged: (value) {
          countryvalue = value;
          pickaddress.add(AdresssPickerEvent());
        },
        onStateChanged: (value) {
          statevalue = value;
          pickaddress.add(AdresssPickerEvent());
        },
        onCityChanged: (value) {
          cityvalue = value;
          pickaddress.add(AdresssPickerEvent());
        },
      );
    },
  );
}
