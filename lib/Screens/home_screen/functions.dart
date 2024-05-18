import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/firebase/functions.dart';
import 'package:kalliyath_villa/firebase/get_functions.dart';

Future<void> refresh(HomeBloc bloc) async {
  await Future.delayed(const Duration(seconds: 2));
  await getVillaDetails();
  bloc.add(Homerebuild());
}

likebutton({required bool istrue, required String id}) async {
  CollectionReference data = await firebaseinstance('VillaDetails');
  await data.doc(id).update({'saved': istrue});
}

villafiltered(List villas) {
  List result = [];
  for (var i in villas) {
    if (i['status'] != true) {
      result.add(i);
    }
  }

  return result;
}

