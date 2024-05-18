import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/profile/functions.dart';
import 'package:kalliyath_villa/Screens/profile/personal_infromation/functions.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

personalformTile(
    {required Size size,
    required BuildContext context,
    required TextEditingController namecontroller,
    required TextEditingController addresscontroller,
    required String? selectedGender,
    required List genders}) {
  return Column(
    children: [
      Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: image == null
                  ? personalinfromation['Image'] == null
                      ? const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 39, 39, 39),
                          backgroundImage:
                              AssetImage('assets/images/user (1).png'),
                          radius: 50,
                        )
                      : CachedNetworkImage(
                          height: 100,
                          fit: BoxFit.cover,
                          width: 100,
                          imageUrl: personalinfromation['Image'],
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 39, 39, 39),
                             backgroundImage:
                                AssetImage('assets/images/user (1).png'),
                            radius: 47,
                          ),
                        )
                  : CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(File(imagepath!)),
                    )),
          Positioned(
              bottom: 0,
              top: 67,
              left: 62,
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 16,
                child: IconButton(
                    onPressed: () {
                      pickImage(context);
                    },
                    icon: const Icon(
                      Icons.mode_edit,
                      size: 18,
                      color: AppColors.black,
                    )),
              )),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter name';
            }
            return null;
          },
          controller: namecontroller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(color: AppColors.white),
          cursorColor: AppColors.white,
          decoration: InputDecoration(
            labelStyle: apptextstyle(color: AppColors.white, size: 14),
            labelText: 'Name',
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
          ),
          onChanged: (value) {
            namecontroller.text = value;
            buttoncolortracker(name: namecontroller.text);
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SizedBox(
          height: size.height / 9,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please add address';
              }
              return null;
            },
            onChanged: (value) {
              buttoncolortracker(name: namecontroller.text, address: value);
            },
            controller: addresscontroller,
            expands: true,
            textAlignVertical: TextAlignVertical.top,
            cursorColor: AppColors.white,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: const TextStyle(color: AppColors.white),
            maxLines: null,
            decoration: InputDecoration(
              labelStyle: apptextstyle(color: AppColors.white, size: 14),
              labelText: 'Address',
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
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Gender',
                style: apptextstyle(color: AppColors.white, size: 15),
              ),
            ),
            SizedBox(
              width: size.width / 1.6,
              child: DropdownButtonFormField<String>(
                dropdownColor: AppColors.black,
                value: selectedGender,
                onChanged: (String? newValue) {
                  selectedGender = newValue!;
                  buttoncolortracker(
                      name: namecontroller.text, gender: selectedGender);
                  bloc1.add(LoginUpdateEvent());
                },
                decoration: InputDecoration(
                  labelStyle: apptextstyle(color: AppColors.white, size: 14),
                  labelText: 'Gender',
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
                items: genders.map((gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(
                      gender,
                      style: apptextstyle(color: AppColors.white, size: 14),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
