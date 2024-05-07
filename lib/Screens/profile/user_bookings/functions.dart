import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalliyath_villa/firebase/user.dart';

Future<List> getUserbookings() async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Bookings').get();

    List villas = querySnapshot.docs..toList();

    return villas;
  } catch (e) {
    log('Error fetching villas: $e');
    return [];
  }
}

filteruserbookings(List allbookings) {
  List result = [];
  for (var i in allbookings) {
    if (i['user'] == appuserid && i['cancelled'] == false) {
      result.add(i);
    }
  }
  return result;
}

filteruserbookingsPast(List allbookings) {
  List result = [];
  for (var i in allbookings) {
    if (i['user'] == appuserid &&
        DateTime.now().isAfter(DateTime.parse(i['villa']['checkout'])) &&
        i['cancelled'] == false) {
      result.add(i);
    }
  }
  return result;
}

filteruserbookingsCancelled(List allbookings) {
  List result = [];
  for (var i in allbookings) {
    if (i['user'] == appuserid && i['cancelled'] == true) {
      result.add(i);
    }
  }
  return result;
}
