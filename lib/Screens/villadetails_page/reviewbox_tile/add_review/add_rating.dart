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
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/review_box/reviewbox_tile.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/reviews.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/firebase/functions.dart';
import 'package:kalliyath_villa/firebase/user.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:kalliyath_villa/widget/snackbar_widget/snackbar.dart';

Future<void> addstardialogue(
    {required BuildContext context,
    required Size size,
    required String id,
    required TextEditingController review,
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
              if (state is ReviewaddLoaderState) {
                return const Center(
                    child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                  ),
                ));
              }
              return AlertDialog(
                alignment: Alignment.center,
                contentPadding: const EdgeInsets.all(0),
                backgroundColor: AppColors.black,
                title: Center(
                  child: Text('Add star',
                      style: apptextstyle(
                          color: AppColors.white,
                          size: 15,
                          weight: FontWeight.w200)),
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
                      starSize: size.height / 14.8,
                      valueLabelRadius: 10,
                      maxValue: 10,
                      starSpacing: 2,
                      animationDuration: const Duration(milliseconds: 1000),
                      starColor: const Color.fromARGB(255, 239, 181, 33),
                    ),
                  ),
                ),
                actions: [
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (value != 0.0) {
                          bloc.add((ReviewaddLoader()));
                          rateusbutton(
                              id: id,
                              value: (value / 2).toString(),
                              review: review,
                              context: context,
                              details: details);
                        } else {
                          snackbarAlert(context, 'Rate villa atleast one star');
                        }
                      },
                      child: Text('Rate us',
                          style: apptextstyle(
                              color: AppColors.white,
                              size: 13,
                              weight: FontWeight.w200)),
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
    required TextEditingController review,
    required BuildContext context,
    required Map<String, dynamic> details}) async {
  final find = await getfirebasedetails('VillaDetails');

  final found = find.firstWhere((element) => element['id'] == id);
  final val = await found['reviews'];
  final CollectionReference firedata =
      FirebaseFirestore.instance.collection('VillaDetails');

  final data = {
    "message": review.text.trim(),
    "star": value,
    "appuserid": appuserid,
    "appusername": appusername,
    "appuserimage": appuserphoto
  };
  review.text = '';
  val.add(data);
  await firedata.doc(id).update({"reviews": val});
  await totalstarbuilder(true, id, []);
  await progressbuider(val);
  revirewbuilderbloc.add(Reviewbuilder(id: id));
  blocreviewbox.add(Reviewbuilder(id: id));
  homebloc.add(Homerebuild());
  savedbloc.add(Savedbuild());
  villadetailsbuilderblc.add(VillaDetailsbuilder());
  Navigator.pop(context);
}
