import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/homescreen.dart';
import 'package:kalliyath_villa/Screens/saved/bloc/saved_bloc.dart';
import 'package:kalliyath_villa/Screens/saved/saved_page.dart';
import 'package:kalliyath_villa/colors/colors.dart';

likebuttonwidget({required String id, required details}) {
  bool istrue = details['saved'];
  return IconButton(
    icon: Icon(
      istrue == true ? EvaIcons.heart : EvaIcons.heartOutline,
      size: 20,
      color: istrue == true ? AppColors.red : AppColors.black,
    ),
    onPressed: () async {
      likeGridbuttonupdate(id, details['saved']);
      homebloc.add(Homerebuild());
    },
  );
}

likeGridbuttonupdate(String id, bool istrue) async {
  final CollectionReference data =
      FirebaseFirestore.instance.collection('VillaDetails');
  await data.doc(id).update({'saved': istrue == true ? false : true});
  savedbloc.add(Savedbuild());
}
