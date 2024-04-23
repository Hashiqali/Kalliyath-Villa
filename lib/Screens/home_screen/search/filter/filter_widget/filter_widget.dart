import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/search/filter/alert_box/alert_box.dart';
import 'package:kalliyath_villa/Screens/home_screen/search/filter/check_box/check_box.dart';
import 'package:kalliyath_villa/Screens/home_screen/search/filter/controller/filter_controller.dart';
import 'package:kalliyath_villa/Screens/home_screen/search/filter/counter/counter_widget.dart';
import 'package:kalliyath_villa/firebase/get_functions.dart';

import '../../bloc/search_bloc.dart';

SearchBloc pricevaluebloc = SearchBloc();
filterwidget({required BuildContext context, required Size size}) {
  String selectedFilter = 'All'; // Default filter
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              BlocBuilder<SearchBloc, SearchState>(
                bloc: pricevaluebloc,
                builder: (context, state) {
                  return Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 218, 218),
                        borderRadius: BorderRadius.circular(10)),
                    width: size.width,
                    height: size.height / 9,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text(
                            'Price/night',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Kalliyath2',
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            child: RangeSlider(
                              labels: RangeLabels(minprice, maxprice),
                              inactiveColor: Colors.grey,
                              activeColor: Colors.black,
                              values: RangeValues(double.parse(minprice),
                                  double.parse(maxprice)),
                              min: 2500,
                              max: 10000,
                              onChanged: (RangeValues values) {
                                minprice = values.start.round().toString();
                                maxprice = values.end.round().toString();
                                pricevaluebloc.add(PriceBuilder());
                              },
                            ),
                          ),
                          Text(
                            '₹$minprice - ₹$maxprice',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Kalliyath2',
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              counterWidget(size: size),
              Row(
                children: [
                  Expanded(
                      child: CheckBoxWidget(
                          istrue: false,
                          ontap: (val) {
                            ac = val;
                          },
                          text: 'Ac')),
                  Expanded(
                      child: CheckBoxWidget(
                          istrue: false,
                          ontap: (val) {
                            playground = val;
                          },
                          text: 'Play Ground')),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: CheckBoxWidget(
                          istrue: false,
                          ontap: (val) {
                            swimmingpool = val;
                          },
                          text: 'Swimming pool')),
                  Expanded(
                      child: CheckBoxWidget(
                          istrue: false,
                          ontap: (val) {
                            fitness = val;
                          },
                          text: 'Fitness Center')),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: CheckBoxWidget(
                          istrue: false,
                          ontap: (val) {
                            spa = val;
                          },
                          text: 'Spa Center')),
                  Expanded(
                      child: CheckBoxWidget(
                          istrue: false,
                          ontap: (val) {
                            tv = val;
                          },
                          text: 'Tv')),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: CheckBoxWidget(
                          istrue: false,
                          ontap: (val) {
                            wifi = wifi;
                          },
                          text: 'Wifi')),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        alertbox(context: context, size: size);
                      },
                      child: Container(
                        width: size.width,
                        height: size.height / 18,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 222, 220, 220),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            'Category',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Kalliyath2',
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: GestureDetector(
                  onTap: () {
                    filterItems(
                        villaDetails,
                        minprice,
                        maxprice,
                        bhk.toString(),
                        ac,
                        playground,
                        swimmingpool,
                        fitness,
                        spa,
                        tv,
                        wifi,
                        categoriesfilteredselected,
                        context);
                  },
                  child: Container(
                    width: size.width,
                    height: size.height / 18,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'Filter',
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
            ],
          ),
        ),
      );
    },
  );
}
