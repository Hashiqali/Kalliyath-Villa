import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/homescreen.dart';
import 'package:kalliyath_villa/Screens/saved/bloc/saved_bloc.dart';
import 'package:kalliyath_villa/Screens/saved/saved_page.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/bloc/details_bloc.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/details_tile/villa_details_tile.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/functions.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/reviews.dart';
import 'package:kalliyath_villa/firebase/get_functions.dart';
import 'package:kalliyath_villa/firebase/user.dart';
import 'package:kalliyath_villa/widget/snackbar.dart';

Future<void> addstardialogue(
    {required BuildContext context,
    required Size size,
    required String id,
    required String review,
    required Map<String, dynamic> details}) async {
  double value = 0;
  DetailsBloc bloc = DetailsBloc();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocBuilder<DetailsBloc, DetailsState>(
            bloc: bloc,
            builder: (context, state) {
              return AlertDialog(
                backgroundColor: Colors.black,
                title: const Center(
                  child: Text(
                    'Add star',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 15,
                      fontFamily: 'Kalliyath2',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                content: SizedBox(
                  height: size.height / 10,
                  width: size.width,
                  child: Center(
                    child: RatingStars(
                      valueLabelVisibility: false,
                      value: value,
                      onValueChanged: (v) {
                        value = v;
                        bloc.add((Starbuilder()));
                      },
                      starBuilder: (index, color) => Icon(
                        EvaIcons.star,
                        color: color,
                        size: 50,
                      ),
                      starCount: 5,
                      starSize: 50,
                      valueLabelRadius: 10,
                      maxValue: 5,
                      starSpacing: 3,
                      animationDuration: Duration(milliseconds: 1000),
                      starColor: Color.fromARGB(255, 239, 181, 33),
                    ),
                  ),
                ),
                actions: [
                  Center(
                    child: TextButton(
                      onPressed: () {
                        rateusbutton(
                            id: id,
                            value: value.toString(),
                            review: review,
                            context: context,
                            details: details);
                      },
                      child: const Text(
                        'Rate us',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 13,
                          fontFamily: 'Kalliyath2',
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      });
}

rateusbutton(
    {required String id,
    required String value,
    required String review,
    required BuildContext context,
    required Map<String, dynamic> details}) async {
  if (value != '0.0') {
    final val = await details['reviews'];
    final CollectionReference firedata =
        FirebaseFirestore.instance.collection('VillaDetails');
    final data = {
      "message": review,
      "star": value,
      "appuserid": appuserid,
      "appusername": appusername,
      "appuserimage": appuserphoto
    };
    val.add(data);
    await firedata.doc(id).update({"reviews": val});
    await getVillaDetails();
    await totalstarbuilder(details['reviews'], true, id);
    homebloc.add(Homerebuild());
    await progressbuider([data]);
    revirewbuilderbloc.add(Reviewbuilder());
    savedbloc.add(Savedbuild());
    villadetailsbuilderblc.add(VillaDetailsbuilder());
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  } else {
    snackbarAlert(context, 'Rate villa');
  }
}
