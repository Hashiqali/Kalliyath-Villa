import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/homescreen.dart';
import 'package:kalliyath_villa/Screens/saved/bloc/saved_bloc.dart';
import 'package:kalliyath_villa/Screens/saved/saved_page.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/bloc/details_bloc.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/details_tile/villa_details_tile.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/review_box/reviewbox_tile.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/reviews.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/firebase/functions.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

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

double totalstar = 0;
int fivestar = 0;
int fourstar = 0;
int threestar = 0;
int twostar = 0;
int onestar = 0;

progressbuider(
  List details,
) {
  totalstar = 0;
  fivestar = 0;
  fourstar = 0;
  threestar = 0;
  twostar = 0;
  onestar = 0;

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
}

totalstarbuilder(bool istrue, String id, List villas) async {
  totalstar = 0.0;

  if (istrue && villas.isEmpty) {
    final find = await getfirebasedetails('VillaDetails');
    final found = find.firstWhere((element) => element['id'] == id);
    num val = 0;

    for (int i = 0; i < found['reviews'].length; i++) {
      val += num.parse(found['reviews'][i]['star']);
    }
    totalstar = (val / found['reviews'].length);

    final CollectionReference firedata =
        FirebaseFirestore.instance.collection('VillaDetails');
    await firedata.doc(id).update({"totalstar": totalstar});
  } else {
    num val = 0;

    for (int i = 0; i < villas.length; i++) {
      val += num.parse(villas[i]['star']);
    }
    totalstar = (val / villas.length);
  }
}

deletereviews(
    {required BuildContext context,
    required Size size,
    required String id,
    required Map<String, dynamic> value,
    required List reviews}) {
  DetailsBloc blocloader = DetailsBloc();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocBuilder<DetailsBloc, DetailsState>(
              bloc: blocloader,
              builder: (context, state) {
                if (state is ReviewaddLoaderState) {
                  return const Center(
                      child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ));
                }
                return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: const Color.fromARGB(255, 22, 22, 22),
                    content: Text('You want delete review?',
                        style: apptextstyle(
                            color: AppColors.white,
                            size: 13,
                            weight: FontWeight.w200)),
                    actionsAlignment: MainAxisAlignment.end,
                    actionsPadding: const EdgeInsets.only(bottom: 10, right: 5),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('No',
                            style: apptextstyle(
                                color: AppColors.white,
                                size: 13,
                                weight: FontWeight.w200)),
                      ),
                      TextButton(
                        onPressed: () {
                          blocloader.add(ReviewaddLoader());
                          deletereview(
                              id: id,
                              value: value,
                              reviews: reviews,
                              context: context);
                        },
                        child: Text('Yes',
                            style: apptextstyle(
                                color: AppColors.white,
                                size: 13,
                                weight: FontWeight.w200)),
                      ),
                    ]);
              }));
    },
  );
}

deletereview(
    {required String id,
    required Map<String, dynamic> value,
    required List reviews,
    required BuildContext context}) async {
  final CollectionReference firedata =
      FirebaseFirestore.instance.collection('VillaDetails');

  reviews.remove(value);
  final reversedlist = reviews.reversed.toList();
  await firedata.doc(id).update({'reviews': reversedlist});
  totalstar = 0;
  fivestar = 0;
  fourstar = 0;
  threestar = 0;
  twostar = 0;
  onestar = 0;
  await totalstarbuilder(true, id, []);
  await progressbuider(reviews);
  revirewbuilderbloc.add(Reviewbuilder(id: id));
  blocreviewbox.add(Reviewbuilder(id: id));
  homebloc.add(Homerebuild());
  savedbloc.add(Savedbuild());
  villadetailsbuilderblc.add(VillaDetailsbuilder());
  Navigator.pop(context);
}
