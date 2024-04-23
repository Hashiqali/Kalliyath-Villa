import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/bloc/details_bloc.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/add_review/add_review.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/functions.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/review_progress/review_progress.dart';

final DetailsBloc revirewbuilderbloc = DetailsBloc();

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key, required this.details});
  final Map<String, dynamic> details;

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  initState() {
    totalstarbuilder(widget.details['reviews'], false, '');
    progressbuider(widget.details['reviews']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Customer Reviews',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 17,
            fontFamily: 'Kalliyath2',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<DetailsBloc, DetailsState>(
        bloc: revirewbuilderbloc,
        builder: (context, state) {
          return Container(
            height: size.height,
            width: size.width,
            color: const Color.fromARGB(255, 1, 10, 19),
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
                          value: widget.details['reviews'].isEmpty
                              ? 0.0
                              : totalstar.toDouble(),
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
                          '${widget.details['reviews'].isEmpty ? '0.0' : totalstar.toString().substring(0, 3)} out of 5',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 17,
                            fontFamily: 'Kalliyath2',
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.details['reviews'].length} Total Ratings',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 15,
                          fontFamily: 'Kalliyath2',
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
                reviewprogress(
                    size: size,
                    text: '5 star',
                    value: widget.details['reviews'].isEmpty
                        ? 0.0
                        : fivestar.toDouble() /
                            widget.details['reviews'].length,
                    count: fivestar.toString()),
                reviewprogress(
                    size: size,
                    text: '4 star',
                    value: widget.details['reviews'].isEmpty
                        ? 0.0
                        : fourstar.toDouble() /
                            widget.details['reviews'].length,
                    count: fourstar.toString()),
                reviewprogress(
                    size: size,
                    text: '3 star',
                    value: widget.details['reviews'].isEmpty
                        ? 0.0
                        : threestar.toDouble() /
                            widget.details['reviews'].length,
                    count: threestar.toString()),
                reviewprogress(
                    size: size,
                    text: '2 star',
                    value: widget.details['reviews'].isEmpty
                        ? 0.0
                        : twostar.toDouble() / widget.details['reviews'].length,
                    count: twostar.toString()),
                reviewprogress(
                    size: size,
                    text: '1 star',
                    value: widget.details['reviews'].isEmpty
                        ? 0.0
                        : onestar.toDouble() / widget.details['reviews'].length,
                    count: onestar.toString()),
                GestureDetector(
                  onTap: () {
                    writereviewdialogue(
                        context: context, size: size, details: widget.details);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: size.height / 18,
                      width: size.width / 1.2,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(187, 99, 227, 19),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          'Write a review',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15,
                            fontFamily: 'Kalliyath2',
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: widget.details['reviews'].isEmpty
                      ? const Center(
                          child: Text(
                            'No Reviews',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 14,
                              fontFamily: 'Kalliyath2',
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: ListView.separated(
                              itemBuilder: (ctx, index) {
                                final reviews =
                                    widget.details['reviews'].reversed.toList();
                                final data = reviews[index];
                                final star = double.parse(data['star']).round();

                                final messege = getMessage(star);
                                return SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                  radius: 11,
                                                  backgroundImage: data[
                                                              'appuserimage'] ==
                                                          ""
                                                      ? const AssetImage(
                                                              'assets/images/user.png')
                                                          as ImageProvider
                                                      : NetworkImage(data[
                                                          'appuserimage'])),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 2, left: 7),
                                                child: Text(
                                                  data['appusername'],
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontSize: 12,
                                                    fontFamily: 'Kalliyath2',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          data['message'],
                                          style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 13,
                                            fontFamily: 'Kalliyath2',
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5, left: 0, top: 2),
                                              child: SizedBox(
                                                width: size.width / 4.5,
                                                child: GridView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemCount: 5,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 5,
                                                    crossAxisSpacing: .0,
                                                    mainAxisSpacing: 0.0,
                                                  ),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    Color color = Colors.white;
                                                    if (star > index) {
                                                      color = Color.fromARGB(
                                                          255, 236, 176, 24);
                                                    } else {
                                                      color = Colors.white;
                                                    }

                                                    return Icon(
                                                        Icons.star_sharp,
                                                        size: 17,
                                                        color: color);
                                                  },
                                                ),
                                              ),
                                            ),
                                            Text(
                                              messege,
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontSize: 12,
                                                fontFamily: 'Kalliyath2',
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (ctx, index) {
                                return const Divider(
                                  thickness: .5,
                                  color: Colors.white,
                                );
                              },
                              itemCount: widget.details['reviews'].length),
                        ),
                )
              ],
            ),
          );
        },
      ),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  void dispose() {
    totalstar = 0;
    fivestar = 0;
    fourstar = 0;
    threestar = 0;
    twostar = 0;
    onestar = 0;
    super.dispose();
  }
}
