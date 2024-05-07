import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/add_date_person/add_date_person.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/bloc/details_bloc.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/functions.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:kalliyath_villa/widget/carousel_widget/carousel_widget.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/facilities_tile/facilities_tile.dart';
import 'package:kalliyath_villa/widget/map_widget/map_widget.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/review_box/reviewbox_tile.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/stack_buttons/stack_buttons.dart';

class VillaDetailsTile extends StatefulWidget {
  const VillaDetailsTile({
    super.key,
    required this.size,
    required this.details,
    required this.place,
  });
  final Size size;
  final dynamic details;

  final String place;

  @override
  State<VillaDetailsTile> createState() => _VillaDetailsTileState();
}

final DetailsBloc villadetailsbuilderblc = DetailsBloc();

class _VillaDetailsTileState extends State<VillaDetailsTile> {
  Map<DateTime, List<dynamic>> eventsMap = {};
  @override
  void initState() {
    init(widget.details['id']);
    blocreviewbox.add(Reviewbuilder(id: widget.details['id']));

    super.initState();
  }

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
                  color: AppColors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.only(top: 10, left: 2, right: 2),
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
                            style: apptextstyle(
                                color: AppColors.white,
                                size: 20,
                                weight: FontWeight.w600),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        BlocBuilder<DetailsBloc, DetailsState>(
                            bloc: blocreviewbox,
                            builder: (context, state) {
                              if (state is ReviewbuilderState) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Text(
                                    state.viiladetails['totalstar']
                                                .toString() ==
                                            '0'
                                        ? '★ 0.0'
                                        : '★ ${state.viiladetails['totalstar'].toString().substring(0, 3)}',
                                    style: apptextstyle(
                                        color: AppColors.white,
                                        size: 16,
                                        weight: FontWeight.w600),
                                    overflow: TextOverflow.visible,
                                  ),
                                );
                              }
                              return Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Text(
                                  widget.details['totalstar'].toString() == '0'
                                      ? '★ 0.0'
                                      : '★ ${widget.details['totalstar'].toString().substring(0, 3)}',
                                  style: apptextstyle(
                                      color: AppColors.white,
                                      size: 16,
                                      weight: FontWeight.w600),
                                  overflow: TextOverflow.visible,
                                ),
                              );
                            }),
                        mapwidget(size: widget.size, details: widget.details),
                        facilitiestile(
                            details: widget.details, size: widget.size),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 25,
                          ),
                          child: Text(
                            'Description',
                            style: apptextstyle(
                                color: AppColors.white,
                                size: 16,
                                weight: FontWeight.w600),
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
                            style: apptextstyle(
                                color: AppColors.white,
                                size: 10,
                                weight: FontWeight.w200),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, top: 5),
                          child: Text(
                            'Bhk : ${widget.details['bhk']}',
                            style: apptextstyle(
                                color: AppColors.white,
                                size: 15,
                                weight: FontWeight.w400),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        reviewboxtile(
                            size: widget.size,
                            context: context,
                            details: widget.details),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => BookingPage(
                                      eventsMap: eventsMap,
                                      place: widget.place,
                                      details: widget.details,
                                    )));
                          },
                          child: Padding(
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
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Book Now',
                                        style: apptextstyle(
                                            color: AppColors.white,
                                            size: widget.size.width / 28,
                                            weight: FontWeight.w400),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        height: widget.size.height / 20,
                                        width: widget.size.width / 4.4,
                                        child: Center(
                                          child: Text(
                                            '${widget.details['price']}/night',
                                            style: apptextstyle(
                                                color: AppColors.black,
                                                size: 14,
                                                weight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
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

  void init(String id) async {
    eventsMap = await getbookeddates(id);
  }
}
