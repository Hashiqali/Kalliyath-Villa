import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/saved/bloc/saved_bloc.dart';
import 'package:kalliyath_villa/Screens/saved/functions.dart';
import 'package:kalliyath_villa/Screens/saved/saved_page.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/villa_details.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

savedGridTile(
    {required BuildContext context,
    required Size size,
    required details,
    required List image}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => VillaDetailsPage(
                details: details,
              )));
    },
    child: Container(
      height: size.height / 3.3,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image[0]),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 21,
                child: IconButton(
                  icon: const Icon(
                    EvaIcons.heart,
                    color: AppColors.red,
                  ),
                  onPressed: () {
                    savedlikebuttonupdate(details['id'], false);
                    savedbloc.add(Savedbuild());
                  },
                ),
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            height: size.height / 12,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      details['name'],
                      style: apptextstyle(
                          color: AppColors.black,
                          size: 18,
                          weight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Image(
                              height: 17,
                              width: 17,
                              image: AssetImage('assets/images/star (1).png'),
                            ),
                            const SizedBox(width: 5),
                            Text(
                                details['totalstar'].toString() == '0'
                                    ? '0.0'
                                    : details['totalstar']
                                        .toString()
                                        .substring(0, 3),
                                style: apptextstyle(
                                    color: AppColors.black, size: 19)),
                            const SizedBox(width: 5),
                            Text('${details['reviews'].length} Reviews',
                                style: apptextstyle(
                                    color: AppColors.black, size: 16)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(details['price'],
                                style: apptextstyle(
                                    color: AppColors.black,
                                    size: 20,
                                    weight: FontWeight.w600)),
                            Text('/night',
                                style: apptextstyle(
                                    color: AppColors.black, size: 15)),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
