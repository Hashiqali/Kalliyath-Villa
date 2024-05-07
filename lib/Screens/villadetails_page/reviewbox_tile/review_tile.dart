import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/bloc/details_bloc.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/add_review/add_review.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/functions.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/review_progress/review_progress.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/reviews.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/reviews_grid_tile/reviews_grid_tile.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

reviewTile(
    {required BuildContext context, required Size size, required details}) {
  return BlocBuilder<DetailsBloc, DetailsState>(
      bloc: revirewbuilderbloc,
      builder: (context, state) {
        if (state is ReviewLoaderState) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.white,
          ));
        }
        if (state is ReviewbuilderState) {
          final data = state.viiladetails;
          final reviews = data['reviews'].reversed.toList();
          totalstarbuilder(false, data['id'], data['reviews']);
          progressbuider(data['reviews']);
          return Container(
            height: size.height,
            width: size.width,
            color: AppColors.darkblue,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: RatingStars(
                          valueLabelVisibility: false,
                          value: data['totalstar'].toString() == 'NaN' ||
                                  data['totalstar'].toString() == '0'
                              ? 0
                              : double.parse(data['totalstar'].toString()),
                          onValueChanged: (v) {},
                          starBuilder: (index, color) => Icon(
                            EvaIcons.star,
                            color: color,
                          ),
                          starCount: 5,
                          starSize: 20,
                          valueLabelRadius: 10,
                          maxValue: 5,
                          starSpacing: 2,
                          animationDuration: const Duration(milliseconds: 1000),
                          starColor: const Color.fromARGB(255, 239, 181, 33),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, top: 3),
                        child: Text(
                            data['totalstar'] == 5
                                ? '5 out of 5'
                                : '${data['totalstar'].toString() == 'NaN' || state.viiladetails['totalstar'].toString() == '0' ? 0.0 : data['totalstar'].toString().substring(0, 3)} out of 5',
                            style: apptextstyle(
                                color: AppColors.white,
                                size: 17,
                                weight: FontWeight.w200)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${data['reviews'].length} Total Ratings',
                          style: apptextstyle(
                              color: AppColors.white,
                              size: 15,
                              weight: FontWeight.w200)),
                    ],
                  ),
                ),
                reviewprogress(
                    size: size,
                    text: '5 star',
                    value: data['reviews'].isEmpty
                        ? 0.0
                        : fivestar.toDouble() / data['reviews'].length,
                    count: fivestar.toString()),
                reviewprogress(
                    size: size,
                    text: '4 star',
                    value: data['reviews'].isEmpty
                        ? 0.0
                        : fourstar.toDouble() / data['reviews'].length,
                    count: fourstar.toString()),
                reviewprogress(
                    size: size,
                    text: '3 star',
                    value: data['reviews'].isEmpty
                        ? 0.0
                        : threestar.toDouble() / data['reviews'].length,
                    count: threestar.toString()),
                reviewprogress(
                    size: size,
                    text: '2 star',
                    value: data['reviews'].isEmpty
                        ? 0.0
                        : twostar.toDouble() / data['reviews'].length,
                    count: twostar.toString()),
                reviewprogress(
                    size: size,
                    text: '1 star',
                    value: data['reviews'].isEmpty
                        ? 0.0
                        : onestar.toDouble() / data['reviews'].length,
                    count: onestar.toString()),
                GestureDetector(
                  onTap: () {
                    writereviewdialogue(
                        context: context, size: size, details: details);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: size.height / 18,
                      width: size.width / 1.2,
                      decoration: BoxDecoration(
                          color: AppColors.lightgreen,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text('Write a review',
                            style: apptextstyle(
                                color: AppColors.white,
                                size: 15,
                                weight: FontWeight.w200)),
                      ),
                    ),
                  ),
                ),
                reviewGridTile(
                    size: size, data: data, reviews: reviews, context: context)
              ],
            ),
          );
        }
        return Container();
      });
}
