import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/bloc/details_bloc.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/reviews.dart';

reviewboxtile(
    {required Size size,
    required BuildContext context,
    required Map<String, dynamic> details}) {
  DetailsBloc bloc = DetailsBloc();
  double value = 3.5;
  int length = details['reviews'].length;
  print(length);
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => ReviewsPage(
                details: details,
              )));
    },
    child: BlocBuilder<DetailsBloc, DetailsState>(
      bloc: bloc,
      builder: (context, state) {
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
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: RatingStars(
                      valueLabelVisibility: false,
                      value:
                          details['totalstar'] == 0 ? 5 : details['totalstar'],
                      onValueChanged: (v) {
                        value = 3.8;
                        bloc.add((Starbuilder()));
                      },
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
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            details['reviews'].isEmpty
                                ? 'Add reviews'
                                : details['reviews'].last['message'],
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontFamily: 'Kalliyath2',
                              fontWeight: FontWeight.w400,
                            ),
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
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                radius: 10,
                                child: ClipOval(
                                  child: details['reviews'].length > 2 &&
                                          details['reviews']
                                                  .last['appuserimage'] !=
                                              ''
                                      ? Image.network(
                                          details['reviews']
                                              .last['appuserimage'],
                                          fit: BoxFit.cover,
                                          width: 35,
                                          height: 35,
                                        )
                                      : Image.asset(
                                          'assets/images/user.png',
                                          fit: BoxFit.cover,
                                          width: 35,
                                          height: 35,
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
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                child: ClipOval(
                                  child: details['reviews'].length > 1 &&
                                          details['reviews']
                                                  .last['appuserimage'] !=
                                              ''
                                      ? Image.network(
                                          details['reviews']
                                              .last['appuserimage'],
                                          fit: BoxFit.cover,
                                          width: 35,
                                          height: 35,
                                        )
                                      : Image.asset(
                                          'assets/images/user.png',
                                          fit: BoxFit.cover,
                                          width: 35,
                                          height: 35,
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
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                child: ClipOval(
                                  child: details['reviews'].isNotEmpty
                                      ? Image.network(
                                          details['reviews']
                                              .last['appuserimage'],
                                          fit: BoxFit.cover,
                                          width: 35,
                                          height: 35,
                                        )
                                      : Image.asset(
                                          'assets/images/user.png',
                                          fit: BoxFit.cover,
                                          width: 35,
                                          height: 35,
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
      },
    ),
  );
}
