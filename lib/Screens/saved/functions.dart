import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/homescreen.dart';
import 'package:kalliyath_villa/Screens/saved/bloc/saved_bloc.dart';
import 'package:kalliyath_villa/Screens/saved/saved_page.dart';

savedlikebuttonupdate(String id, bool istrue) async {
  print(id);
  final CollectionReference data =
      FirebaseFirestore.instance.collection('VillaDetails');
  await data.doc(id).update({'saved': istrue});
  savedbloc.add(Savedbuild());
  homebloc.add(Homerebuild());
}
