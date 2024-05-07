import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/cancel_booking/bloc/cancel_bloc.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/cancel_booking/cancel_options/cancel_options.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/cancel_booking/functions.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/cancel_booking/refund_policy/refund_policy.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

bool loading = false;
bool textfieldistrue = false;
bool isReasonSelected = false;
bool is6thReasonSelected = false;
String reason = '';
cancelTile(
    {required Size size,
    required bloccancel,
    required key1,
    required reasoncontroller,
    required blocprivacy,
    required buttonclick,
    required BuildContext context,
    required id}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
              color: const Color.fromARGB(26, 255, 255, 255),
              height: size.height / 15,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.exclamationmark_circle,
                    color: AppColors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'This is needed to complete your cancellation',
                      style: apptextstyle(color: AppColors.white, size: 15),
                    ),
                  )
                ],
              )),
        ),
        canceloptions(
            bloccancel: bloccancel,
          
            key1: key1,
            size: size,
            reasoncontroller: reasoncontroller),
        refundpolicy(size: size, blocprivacy: blocprivacy),
        BlocBuilder<CancelBloc, CancelState>(
          bloc: buttonclick,
          builder: (context1, state) {
            if (state is ProceedButtonState) {
              loading = true;
            }
            return GestureDetector(
                onTap: () {
                  if (!loading) {
                    proceedfunction(
                        is6thReasonSelected: is6thReasonSelected,
                        button: buttonclick,
                        isReasonSelected: isReasonSelected,
                        key: key1,
                        context: context,
                        id: id,
                        textfield: textfieldistrue,
                        text: reasoncontroller,
                        reason: reason);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Center(
                    child: Container(
                      height: size.height / 18,
                      decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      width: size.width / 1.1,
                      child: Center(
                        child: loading == true
                            ? Center(
                                child: SizedBox(
                                height: size.height / 25,
                                width: size.width / 12,
                                child: const CircularProgressIndicator(
                                  color: AppColors.white,
                                ),
                              ))
                            : Text('Proceed',
                                style: apptextstyle(
                                    color: AppColors.white,
                                    size: 17,
                                    family: 'Kalliyath',
                                    weight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ));
          },
        ),
      ],
    ),
  );
}
