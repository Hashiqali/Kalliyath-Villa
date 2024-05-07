import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/booking_page/bloc/booking_bloc.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

String countryCode = '';
countryCodePickerWiget() {
  BookingBloc countrypicker = BookingBloc();

  return BlocBuilder<BookingBloc, BookingState>(
    bloc: countrypicker,
    builder: (context, state) {
      return CountryCodePicker(
        searchDecoration: const InputDecoration(
          prefixIconColor: AppColors.white,
          filled: true,
          fillColor: Color.fromARGB(186, 46, 45, 45),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 240, 238, 238),
            ),
          ),
        ),
        searchStyle: apptextstyle(color: AppColors.white, size: 14),
        closeIcon: const Icon(
          Icons.close,
          color: AppColors.white,
        ),
        dialogTextStyle: apptextstyle(color: AppColors.white, size: 14),
        boxDecoration: BoxDecoration(
            color: AppColors.black, borderRadius: BorderRadius.circular(10)),
        textStyle: apptextstyle(color: AppColors.white, size: 14),
        onChanged: (CountryCode? code) {
          if (code != null) {
            countryCode = code.dialCode!;
            countrypicker.add(ContryCodePickerEvent());
          }
        },
        onInit: (value) {
          countryCode = value.toString();
        },
        initialSelection: 'IN',
        favorite: const ['+91', 'IN'],
        showCountryOnly: false,
        showOnlyCountryWhenClosed: false,
        alignLeft: false,
      );
    },
  );
}
