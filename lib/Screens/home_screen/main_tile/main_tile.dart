import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/grid_tile/like_button.dart';
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
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage((details['images'].first)),
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
                backgroundColor: Colors.white,
                radius: 21,
                child: IconButton(
                  icon: Icon(
                    istrue == true ? EvaIcons.heart : EvaIcons.heartOutline,
                    size: 25,
                    color: istrue == true
                        ? Colors.red
                        : const Color.fromARGB(255, 0, 0, 0),
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
              color: Color.fromARGB(255, 255, 255, 255),
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
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Kalliyath2',
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2, left: 6, right: 16),
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
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontFamily: 'Kalliyath2',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              '10k Reviews',
                              style: TextStyle(
                                color: Color.fromARGB(155, 0, 0, 0),
                                fontSize: 16,
                                fontFamily: 'Kalliyath2',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '₹${details['price']}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Kalliyath2',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              '/night',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Kalliyath2',
                              ),
                            ),
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
