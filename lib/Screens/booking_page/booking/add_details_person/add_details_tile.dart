import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/add_details_person/country_length/country_no_length.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/add_details_person/functions.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

import 'package:kalliyath_villa/widget/select_country_state_city_widget/select_widget.dart';

String countryCode = '';
int numberlength = 10;
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
                                  InternationalPhoneNumberInput(
                                    height: size.height / 17,
                                    controller: phonecontroller,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(
                                          numberlength)
                                    ],
                                    initCountry: CountryCodeModel(
                                        name: "India",
                                        dial_code: "+91",
                                        code: "IN"),
                                    betweenPadding: 23,
                                    onInputChanged: (phone) {
                                      // print(phone.code);
                                      // print(phone.dial_code);
                                      // print(phone.number);

                                      // print(phone.rawNumber);
                                      // print(phone.rawDialCode);
                                      numberlength =
                                          countryPhoneLength[phone.dial_code] ??
                                              10.toInt();

                                      countryCode = phone.rawDialCode;
                                    },
                                    dialogConfig: DialogConfig(
                                      backgroundColor:
                                          const Color.fromARGB(255, 91, 91, 92),
                                      searchBoxBackgroundColor:
                                          const Color(0xFF56565a),
                                      searchBoxIconColor:
                                          const Color(0xFFFAFAFA),
                                      countryItemHeight: 55,
                                      topBarColor: const Color(0xFF1B1C24),
                                      selectedItemColor:
                                          const Color(0xFF56565a),
                                      selectedIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Image.asset(
                                          "assets/check.png",
                                          width: 20,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      textStyle: TextStyle(
                                        color: const Color(0xFFFAFAFA)
                                            .withOpacity(0.7),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      searchBoxTextStyle: TextStyle(
                                        color: const Color(0xFFFAFAFA)
                                            .withOpacity(0.7),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      titleStyle: const TextStyle(
                                        color: Color(0xFFFAFAFA),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      searchBoxHintStyle: TextStyle(
                                        color: const Color(0xFFFAFAFA)
                                            .withOpacity(0.7),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    countryConfig: CountryConfig(
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              186, 46, 45, 45),
                                          border: Border.all(
                                              width: 1,
                                              color: const Color.fromARGB(
                                                  255, 91, 91, 92)),
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        flagSize: size.width / 18,
                                        noFlag: false,
                                        textStyle: apptextstyle(
                                            color: AppColors.white,
                                            size: 16,
                                            family: '')),
                                    validator: (number) {
                                      if (number.number.isEmpty) {
                                        return "Please enter phone number";
                                      } else if (number.number.length !=
                                          numberlength) {
                                        return "Please enter valid phone number";
                                      }
                                      return null;
                                    },
                                    phoneConfig: PhoneConfig(
                                      focusedColor: AppColors.white,
                                      enabledColor:
                                          const Color.fromARGB(255, 91, 91, 92),
                                      errorColor: AppColors.red,
                                      focusNode: focusNode2,
                                      radius: 3,
                                      borderWidth: 1,
                                      backgroundColor:
                                          const Color.fromARGB(186, 46, 45, 45),
                                      popUpErrorText: true,
                                      showCursor: true,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      errorPadding:
                                          const EdgeInsets.only(top: 14),
                                      errorStyle: apptextstyle(
                                          family: '',
                                          color: AppColors.red,
                                          weight: FontWeight.w400,
                                          size: 12),
                                      textStyle: apptextstyle(
                                          family: '',
                                          color: AppColors.white,
                                          weight: FontWeight.w400,
                                          size: 16),
                                      hintStyle: apptextstyle(
                                          family: '',
                                          color:
                                              AppColors.white.withOpacity(0.5),
                                          size: 12),
                                    ),
                                  )
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
