import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/bloc/details_bloc.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/reviews.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

DetailsBloc blocreviewbox = DetailsBloc();
reviewboxtile(
    {required Size size,
    required BuildContext context,
    required Map<String, dynamic> details}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => ReviewsPage(
                details: details,
              )));
    },
    child: BlocBuilder<DetailsBloc, DetailsState>(
        bloc: blocreviewbox,
        builder: (context, state) {
          if (state is ReviewbuilderState) {
            int length = state.viiladetails['reviews'].length;

            return Padding(
              padding: const EdgeInsets.only(top: 10, right: 25, left: 25),
              child: Center(
                child: Container(
                  height: size.height / 8,
                  width: size.width / 1.1,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(192, 71, 70, 70),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: RatingStars(
                              valueLabelVisibility: false,
                              value: state.viiladetails['totalstar'] == 0 ||
                                      state.viiladetails['totalstar']
                                              .toString() ==
                                          'NaN'
                                  ? 5
                                  : state.viiladetails['totalstar'],
                              starBuilder: (index, color) => Icon(
                                EvaIcons.star,
                                color: color,
                              ),
                              starCount: 5,
                              starSize: 20,
                              valueLabelRadius: 10,
                              maxValue: 5,
                              starSpacing: 2,
                              animationDuration:
                                  const Duration(milliseconds: 1000),
                              starColor:
                                  const Color.fromARGB(255, 239, 181, 33),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 4),
                            child: Text(
                                state.viiladetails['totalstar'] == 5
                                    ? '5 out of 5'
                                    : '${state.viiladetails['totalstar'].toString() == 'NaN' || state.viiladetails['totalstar'].toString() == '0' ? 0.0 : state.viiladetails['totalstar'].toString().substring(0, 3)} out of 5',
                                style: apptextstyle(
                                    color: AppColors.white,
                                    size: 14,
                                    family: 'Kalliyath',
                                    weight: FontWeight.normal)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                state.viiladetails['reviews'].isEmpty
                                    ? 'Click to add reviews'
                                    : state.viiladetails['reviews']
                                        .last['message'],
                                style: apptextstyle(
                                    color: AppColors.white,
                                    size: state.viiladetails['reviews'].isEmpty
                                        ? 14
                                        : 12),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Stack(
                              children: [
                                SizedBox(
                                  height: size.height / 23,
                                  width: size.width / 3.5,
                                ),
                                Positioned(
                                  left: 75,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.white,
                                    radius: size.width / 10,
                                    child: ClipOval(
                                      child: state.viiladetails['reviews']
                                                      .length >
                                                  2 &&
                                              state.viiladetails['reviews']
                                                      .last['appuserimage'] !=
                                                  ''
                                          ? Image.network(
                                              state.viiladetails['reviews']
                                                  [length - 3]['appuserimage'],
                                              fit: BoxFit.cover,
                                              width: size.width / 11,
                                              height: size.width / 11,
                                            )
                                          : Image.asset(
                                              'assets/images/user.png',
                                              fit: BoxFit.cover,
                                              width: size.width / 12,
                                              height: size.width / 12,
                                            ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 42,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: AppColors.white,
                                    child: ClipOval(
                                      child: state.viiladetails['reviews']
                                                      .length >
                                                  1 &&
                                              state.viiladetails['reviews']
                                                      .last['appuserimage'] !=
                                                  ''
                                          ? Image.network(
                                              state.viiladetails['reviews']
                                                  [length - 2]['appuserimage'],
                                              fit: BoxFit.cover,
                                              width: size.width / 11,
                                              height: size.width / 11,
                                            )
                                          : Image.asset(
                                              'assets/images/user.png',
                                              fit: BoxFit.cover,
                                              width: size.width / 12,
                                              height: size.width / 12,
                                            ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 9,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: AppColors.white,
                                    child: ClipOval(
                                      child: state.viiladetails['reviews']
                                              .isNotEmpty
                                          ? Image.network(
                                              state.viiladetails['reviews']
                                                  .last['appuserimage'],
                                              fit: BoxFit.cover,
                                              width: size.width / 11,
                                              height: size.width / 11,
                                            )
                                          : Image.asset(
                                              'assets/images/user.png',
                                              fit: BoxFit.cover,
                                              width: size.width / 12,
                                              height: size.width / 12,
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        }),
  );
}
