import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/cancel_booking/bloc/cancel_bloc.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/cancel_booking/cancel_check_box/cancel_check_box.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/cancel_booking/cancel_tile/cancel_tile.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/cancel_booking/functions.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

canceloptions(
    {required CancelBloc bloccancel,
    required GlobalKey<FormState> key1,
    required Size size,
    required TextEditingController reasoncontroller}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 13, bottom: 5, top: 5),
        child: Text(
          'Tell us your reason for cancellation',
          style: apptextstyle(color: AppColors.white, size: 15),
        ),
      ),
      BlocBuilder<CancelBloc, CancelState>(
        bloc: bloccancel,
        builder: (context, state) {
          textfieldistrue = state is BookingOptionState6 && true;
          isReasonSelected = isAnyReasonSelected(state);
          is6thReasonSelected = is6ReasonSelected(state);
          return Column(
            children: [
              cancelCheckBox(
                  value: state is BookingOptionState1 && true,
                  text: 'I found an alternative accommodation option',
                  ontap: (value) {
                    reason = 'I found an alternative accommodation option';
                    bloccancel.add(BookingOption1());
                  }),
              cancelCheckBox(
                  value: state is BookingOptionState2 && true,
                  text: 'Change of dates or destination',
                  ontap: (value) {
                    reason = 'Change of dates or destination';
                    bloccancel.add(BookingOption2());
                  }),
              cancelCheckBox(
                  value: state is BookingOptionState3 && true,
                  text: 'Change in the number or needs of travellers',
                  ontap: (value) {
                    reason = 'Change in the number or needs of travellers';
                    bloccancel.add(BookingOption3());
                  }),
              cancelCheckBox(
                  value: state is BookingOptionState4 && true,
                  text: 'Personal/trip was called off',
                  ontap: (value) {
                    reason = 'Personal/trip was called off';
                    bloccancel.add(BookingOption4());
                  }),
              cancelCheckBox(
                  value: state is BookingOptionState5 && true,
                  text:
                      'Made bookings for the same dates, want to cancel the ones I don\'t need',
                  ontap: (value) {
                    reason =
                        'Made bookings for the same dates, want to cancel the ones I don\'t need';
                    bloccancel.add(BookingOption5());
                  }),
              cancelCheckBox(
                  value: state is BookingOptionState6 && true,
                  text: 'None of the above',
                  ontap: (value) {
                    bloccancel.add(BookingOption6());
                  }),
              state is BookingOptionState6 && true
                  ? Padding(
                      padding: const EdgeInsets.only(left: 15, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 10),
                            child: Text(
                              'In your own words, please explain why you\'re cancelling',
                              style: apptextstyle(
                                  color: AppColors.white, size: 15),
                            ),
                          ),
                          Form(
                            key: key1,
                            child: SizedBox(
                              height: size.height / 7,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please add reason';
                                  }
                                  return null;
                                },
                                controller: reasoncontroller,
                                expands: true,
                                textAlignVertical: TextAlignVertical.top,
                                cursorColor: AppColors.white,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                style: const TextStyle(color: AppColors.white),
                                maxLines: null,
                                decoration: InputDecoration(
                                  helperText: '',
                                  isDense: false,
                                  filled: true,
                                  fillColor: AppColors.fillcolor,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  contentPadding: const EdgeInsets.all(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox()
            ],
          );
        },
      ),
    ],
  );
}
