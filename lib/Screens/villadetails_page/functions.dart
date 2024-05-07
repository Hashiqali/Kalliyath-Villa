import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<DateTime, List<dynamic>>> getbookeddates(String id) async {
  Map<DateTime, List<dynamic>> datetimes = {};
  List<Map<String, dynamic>> bookings = [];

  final CollectionReference firedata =
      FirebaseFirestore.instance.collection('Bookings');

  QuerySnapshot querySnapshot = await firedata.get();

  for (var doc in querySnapshot.docs) {
    if (doc.exists) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      if (data != null && data['villa']['villaid'] == id) {
        data['id'] = doc.id;
        bookings.add(data);
      }
    }
  }

  for (int i = 0; i < bookings.length; i++) {
    String startDatetimeString = bookings[i]['villa']['checkin'];
    String endDatetimeString = bookings[i]['villa']['checkout'];
    DateTime startDatetime = DateTime.parse(startDatetimeString);
    DateTime endDatetime = DateTime.parse(endDatetimeString);

    DateTime currentDate = DateTime.utc(
        startDatetime.year, startDatetime.month, startDatetime.day);

    while (currentDate.isBefore(endDatetime) ||
        currentDate.isAtSameMomentAs(endDatetime)) {
      datetimes[currentDate.toUtc()] = [];

      currentDate = currentDate.add(const Duration(days: 1));
    }
  }

  return datetimes;
}
