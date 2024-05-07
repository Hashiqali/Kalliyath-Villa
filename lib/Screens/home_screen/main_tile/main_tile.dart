import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:kalliyath_villa/widget/like_button_widget.dart/like_button_widget.dart';
import 'package:kalliyath_villa/Screens/home_screen/homescreen.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/villa_details.dart';

Widget maintilewidget(
    {required Size size,
    required Map<String, dynamic> details,
    required BuildContext context}) {
  bool istrue = details['saved'];

  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => VillaDetailsPage(details: details)));
    },
    child: Container(
      height: size.height / 3.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              details['images'].first,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 60),
                    child: Center(
                      child: SizedBox(
                        height: 55,
                        width: 55,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 21,
                    child: IconButton(
                      icon: Icon(
                        istrue == true ? EvaIcons.heart : EvaIcons.heartOutline,
                        size: 25,
                        color: istrue == true ? AppColors.red : AppColors.black,
                      ),
                      onPressed: () async {
                        likeGridbuttonupdate(details['id'], details['saved']);
                        homebloc.add(Homerebuild());
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
                                  image:
                                      AssetImage('assets/images/star (1).png'),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                    details['totalstar'].toString() == '0' ||
                                            details['totalstar'].toString() ==
                                                'NaN'
                                        ? '0.0'
                                        : details['totalstar']
                                            .toString()
                                            .substring(0, 3),
                                    style: apptextstyle(
                                        color: AppColors.black, size: 19)),
                                const SizedBox(width: 5),
                                Text(' ${details['reviews'].length} Reviews',
                                    style: apptextstyle(
                                        color: AppColors.black, size: 16)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('₹${details['price']}',
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
        ],
      ),
    ),
  );
}
