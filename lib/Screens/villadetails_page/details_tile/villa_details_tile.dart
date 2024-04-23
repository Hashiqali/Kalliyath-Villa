import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/bloc/details_bloc.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/carousel_widget/carousel_widget.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/facilities_tile/facilities_tile.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/map_widget/map_widget.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/review_box/reviewbox_tile.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/stack_buttons/stack_buttons.dart';

class VillaDetailsTile extends StatefulWidget {
  const VillaDetailsTile(
      {super.key,
      required this.size,
      required this.details,
      required this.place});
  final Size size;
  final Map<String, dynamic> details;
  final String place;

  @override
  State<VillaDetailsTile> createState() => _VillaDetailsTileState();
}

final DetailsBloc villadetailsbuilderblc = DetailsBloc();

class _VillaDetailsTileState extends State<VillaDetailsTile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      bloc: villadetailsbuilderblc,
      builder: (context, state) {
        return Stack(
          children: [
            carouselWidget(size: widget.size, details: widget.details),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: widget.size.height / 1.6,
                width: widget.size.width,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                          ),
                          child: Text(
                            '${widget.details['name']}, ${widget.place}, ${widget.details['locationadress']['state']}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                              fontFamily: 'Kalliyath2',
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            widget.details['totalstar'].toString() == '0'
                                ? '★ 0.0'
                                : '★ ${widget.details['totalstar'].toString().substring(0, 3)}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontFamily: 'Kalliyath2',
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        mapwidget(size: widget.size, details: widget.details),
                        facilitiestile(
                            details: widget.details, size: widget.size),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 25,
                          ),
                          child: Text(
                            'Introduction',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontFamily: 'Kalliyath2',
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 25,
                            top: 2,
                            left: 25,
                          ),
                          child: Text(
                            widget.details['description'],
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 10,
                              fontFamily: 'Kalliyath2',
                              fontWeight: FontWeight.w200,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, top: 5),
                          child: Text(
                            'Bhk : ${widget.details['bhk']}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 15,
                              fontFamily: 'Kalliyath2',
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        reviewboxtile(
                            size: widget.size,
                            context: context,
                            details: widget.details),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 30),
                          child: Center(
                            child: Container(
                              height: widget.size.height / 16,
                              width: widget.size.width / 1.8,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(49, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Book Now',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 16,
                                        fontFamily: 'Kalliyath2',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      height: widget.size.height / 20,
                                      width: widget.size.width / 4.4,
                                      child: Center(
                                        child: Text(
                                          '${widget.details['price']}/Day',
                                          style: const TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 14,
                                            fontFamily: 'Kalliyath2',
                                            fontWeight: FontWeight.w700,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            stackbuttons(context: context, details: widget.details),
          ],
        );
      },
    );
  }
}
