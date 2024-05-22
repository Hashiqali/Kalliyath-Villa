import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/add_details_person/functions.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

import 'package:kalliyath_villa/widget/select_country_state_city_widget/select_widget.dart';

String countryCode = '';
secondBookingTile(
    {required Size size,
    required BuildContext context,
    required key,
    required focusNode1,
    required focusNode2,
    required focusNode3,
    required focusNode4,
    required Map<String, dynamic> details,
    required String place,
    required Map<String, Object?> bookingdetails,
    required TextEditingController namecontroller,
    required TextEditingController phonecontroller,
    required TextEditingController addresscontroller,
    required TextEditingController pincodecontroller}) {
  return Container(
    height: size.height,
    width: size.width,
    color: AppColors.black,
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: key,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height / 90,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text('Name',
                              style: apptextstyle(
                                  color: AppColors.white, size: 14)),
                        ),
                        TextFormField(
                            focusNode: focusNode1,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                            controller: namecontroller,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: const TextStyle(color: AppColors.white),
                            cursorColor: AppColors.white,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.person),
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
                            )),
                        SizedBox(
                          height: size.height / 40,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text('Phone Number',
                                        style: apptextstyle(
                                            color: AppColors.white, size: 14)),
                                  ),
                                  IntlPhoneField(
                                    initialValue: '+91',
                                    dropdownTextStyle: const TextStyle(
                                        color: AppColors.white, fontSize: 15.4),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'^[0-9]*$')),
                                    ],
                                    controller: phonecontroller,
                                    validator: (phone) {
                                      if (phone == null ||
                                          !phone.isValidNumber()) {
                                        return 'Please enter a valid phone number';
                                      }
                                      return null;
                                    },
                                    initialCountryCode: 'IN',
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.phone,
                                    dropdownIcon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: AppColors.white,
                                    ),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors.white,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Phone Number',
                                      hintStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 86, 86, 86),
                                          fontWeight: FontWeight.normal),
                                      filled: true,
                                      fillColor:
                                          const Color.fromARGB(186, 46, 45, 45),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      suffixIcon: const Icon(
                                          Icons.phone_android_outlined),
                                      contentPadding: const EdgeInsets.all(8),
                                    ),
                                    onCountryChanged: (phone) {
                                      print('phone==$phone');
                                      countryCode = phone.displayCC;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height / 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text('Address',
                              style: apptextstyle(
                                  color: AppColors.white, size: 14)),
                        ),
                        SizedBox(
                          height: size.height / 9,
                          child: TextFormField(
                            focusNode: focusNode3,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please add address';
                              }
                              return null;
                            },
                            controller: addresscontroller,
                            expands: true,
                            textAlignVertical: TextAlignVertical.top,
                            cursorColor: AppColors.white,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: const TextStyle(color: AppColors.white),
                            maxLines: null,
                            decoration: InputDecoration(
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
                        SizedBox(
                          height: size.height / 40,
                        ),
                        selectCountryStateCityWidget(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text('Pincode',
                              style: apptextstyle(
                                  color: AppColors.white, size: 14)),
                        ),
                        TextFormField(
                            focusNode: focusNode4,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter pincode';
                              }
                              return null;
                            },
                            controller: pincodecontroller,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^[0-9]*$')),
                            ],
                            cursorColor: AppColors.white,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: const TextStyle(color: AppColors.white),
                            decoration: InputDecoration(
                              suffixIcon:
                                  const Icon(Icons.location_searching_rounded),
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
                            )),
                        SizedBox(
                          height: size.height / 70,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              focusNode1.unfocus();
              focusNode2.unfocus();
              focusNode3.unfocus();
              focusNode4.unfocus();
              confirmbooking(
                  details: details,
                  place: place,
                  context: context,
                  countryCode: countryCode == '' ? '91' : countryCode,
                  cityvalue: cityvalue,
                  countryvalue: countryvalue,
                  statevalue: statevalue,
                  namecontroller: namecontroller,
                  addresscontroller: addresscontroller,
                  bookingdetails: bookingdetails,
                  phonecontroller: phonecontroller,
                  pincodecontroller: pincodecontroller,
                  key: key);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                child: Container(
                  height: size.height / 15,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 28, 83, 246),
                      borderRadius: BorderRadius.circular(15)),
                  width: size.width / 1.1,
                  child: Center(
                    child: Text('Confirm Booking',
                        style: apptextstyle(
                            color: AppColors.white,
                            size: 17,
                            family: 'Kalliyath',
                            weight: FontWeight.w500)),
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
