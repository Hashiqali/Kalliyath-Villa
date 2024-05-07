import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalliyath_villa/Screens/search/filter/controller/filter_controller.dart';
import 'package:kalliyath_villa/firebase/functions.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/facilities_tile/pick_function.dart';

initialgetfunctions() async {
  await getsignup();
  await getVillaDetails();
  await getCategories();
}

List<Map<String, dynamic>> signupDocuments = [];
getsignup() async {
  signupDocuments.clear();
  signupDocuments = await getfirebasedetails('signup');
  print('singup=$signupDocuments');
}

List<Map<String, dynamic>> villaDetails = [];
getVillaDetails() async {
  villaDetails.clear();
  final val = await getfirebasedetails('VillaDetails');
  villaDetails = await pickfacilities(val);
  print('details=$villaDetails');
}

getSavedDetails() async {
  List<Map<String, dynamic>> vDetails = [];
  final data = await getfirebasedetails('VillaDetails');
  for (var i in data) {
    if (i['saved'] == true) {
      vDetails.add(i);
    }
  }
  final val = await pickfacilities(vDetails);

  return val;
}

getCategories() async {
  allCategories.clear();

  allCategories = await getfirebasedetails('Categories');
  log('categories=$allCategories');
}

Future<List> getVillas() async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('VillaDetails').get();

    List villas = querySnapshot.docs..toList();

    return villas;
  } catch (e) {
    log('Error fetching villas: $e');
    return [];
  }
}
