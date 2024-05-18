import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/profile/functions.dart';
import 'package:kalliyath_villa/Screens/profile/personal_infromation/functions.dart';
import 'package:kalliyath_villa/Screens/profile/personal_infromation/personal_tile.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

class PersonalInfromation extends StatefulWidget {
  const PersonalInfromation({super.key});

  @override
  State<PersonalInfromation> createState() => _PersonalInfromationState();
}

class _PersonalInfromationState extends State<PersonalInfromation> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  String? _selectedGender;
  SplashLoginBloc loadingbutton = SplashLoginBloc();
  List<String> genders = ['Male', 'Female', 'Other',];
  @override
  void initState() {
    namecontroller.text = personalinfromation['Username'];
    addresscontroller.text = personalinfromation['address'] ?? '';
    if (personalinfromation['gender'] == 'Male' ||
        personalinfromation['gender'] == 'Female' ||
        personalinfromation['gender'] == 'Other') {
      _selectedGender = personalinfromation['gender'] ?? 'null';
    }
    super.initState();
  }

  @override
  void dispose() {
    image = null;
    buttoncolor = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.black,
          centerTitle: true,
          title: Text('Personal Infomation',
              style: apptextstyle(
                  color: AppColors.white, family: 'Kalliyath', size: 20)),
        ),
        body: personalTile(
            size: size,
            namecontroller: namecontroller,
            addresscontroller: addresscontroller,
            selectedGender: _selectedGender,
            genders: genders,
            loadingbutton: loadingbutton));
  }
}
