import 'package:kalliyath_villa/firebase/functions.dart';

Map<String, dynamic> personalinfromation = {};
bool isemail = false;
getprofiles(String id) async {
  final profiles = await getfirebasedetails('signup');
  personalinfromation = profiles.firstWhere(
    (element) => element['id'] == id,
    orElse: () => {},
  );
  if (personalinfromation['Email'] != null) {
    isemail = true;
  }
}
