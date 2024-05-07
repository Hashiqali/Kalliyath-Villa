import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/profile/change_password/bloc/password_bloc.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

changePassFormTile(
    {required oldpass,
    required TextEditingController passcontroller,
    required PasswordBloc pass,
    required newpass,
    required TextEditingController newpasscontroller,
    required TextEditingController newpasscnfrmcontroller,
    required newcnfmpas}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Text('Old Password',
            style: apptextstyle(color: AppColors.white, size: 14)),
      ),
      TextFormField(
        obscureText: oldpass,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter old password';
          }
          return null;
        },
        controller: passcontroller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(color: AppColors.white),
        cursorColor: AppColors.white,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                pass.add(OldpassEvent(istrue: oldpass));
              },
              icon: Icon(
                oldpass == false ? Icons.visibility : Icons.visibility_off,
                color: const Color.fromARGB(151, 255, 255, 255),
              )),
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
      Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Text('New Password',
            style: apptextstyle(color: AppColors.white, size: 14)),
      ),
      TextFormField(
        obscureText: newpass,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter new password';
          }
          if (value.length < 8) {
            return 'Password must be at least 8 characters long';
          }
          return null;
        },
        controller: newpasscontroller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(color: AppColors.white),
        cursorColor: AppColors.white,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                pass.add(NewpassEvent(istrue: newpass));
              },
              icon: Icon(
                newpass == false ? Icons.visibility : Icons.visibility_off,
                color: const Color.fromARGB(151, 255, 255, 255),
              )),
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
      Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Text('Confirm Password',
            style: apptextstyle(color: AppColors.white, size: 14)),
      ),
      TextFormField(
      
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter confirm password';
          }
          if (value.length < 8) {
            return 'Password must be at least 8 characters long';
          }
          return null;
        },
        controller: newpasscnfrmcontroller,
        obscureText: newcnfmpas,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(color: AppColors.white),
        cursorColor: AppColors.white,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                pass.add(NewConfirmpassEvent(istrue: newcnfmpas));
              },
              icon: Icon(
                newcnfmpas == false ? Icons.visibility : Icons.visibility_off,
                color: const Color.fromARGB(151, 255, 255, 255),
              )),
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
    ],
  );
}
