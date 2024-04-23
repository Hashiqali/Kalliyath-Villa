import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalliyath_villa/firebase/functions.dart';

String getMessage(int stars) {
  if (stars == 5) {
    return "Excellent";
  } else if (stars == 4) {
    return "Good";
  } else if (stars == 3) {
    return "Average";
  } else if (stars == 2) {
    return "Poor";
  } else {
    return "Terrible";
  }
}

num totalstar = 0;
int fivestar = 0;

int fourstar = 0;
int threestar = 0;
int twostar = 0;
int onestar = 0;

progressbuider(List details) {
  if (details.isNotEmpty) {
    for (int i = 0; i < details.length; i++) {
      if (details[i]['star'] == '1.0') {
        onestar++;
      } else if (details[i]['star'] == '2.0') {
        twostar++;
      } else if (details[i]['star'] == '3.0') {
        threestar++;
      } else if (details[i]['star'] == '4.0') {
        fourstar++;
      } else if (details[i]['star'] == '5.0') {
        fivestar++;
      }
    }
  }
  print('5=$fivestar,4=$fourstar,3=$threestar,2=$twostar,1=$onestar');
}

totalstarbuilder(details, bool istrue, String id) async {
  totalstar = 0.0;
  final CollectionReference firedata =
      FirebaseFirestore.instance.collection('VillaDetails');
  num val = 0;

  for (int i = 0; i < details.length; i++) {
    val += num.parse(details[i]['star']);
  }
  totalstar = (val / details.length) % 5;

  if (istrue) {
    await firedata.doc(id).update({"totalstar": totalstar});
  }
}
