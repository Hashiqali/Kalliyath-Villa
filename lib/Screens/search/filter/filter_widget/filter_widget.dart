import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/search/filter/alert_box/alert_box.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:kalliyath_villa/widget/check_box_widget/check_box.dart';
import 'package:kalliyath_villa/Screens/search/filter/controller/filter_controller.dart';
import 'package:kalliyath_villa/widget/filter_counter_widget/counter_widget.dart';
import 'package:kalliyath_villa/firebase/get_functions.dart';
import '../../bloc/search_bloc.dart';

SearchBloc pricevaluebloc = SearchBloc();
filterwidget({required BuildContext context, required Size size}) {
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
                        color: const Color.fromARGB(255, 222, 220, 220),
                        borderRadius: BorderRadius.circular(10)),
                    width: size.width,
                    height: size.height / 11.4,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text('Price/night',
                              style: apptextstyle(
                                  color: AppColors.black,
                                  size: size.width / 35,
                                  weight: FontWeight.w200)),
                          SizedBox(
                            height: size.height / 70,
                            child: RangeSlider(
                              labels: RangeLabels(minprice, maxprice),
                              inactiveColor: Colors.grey,
                              activeColor: AppColors.black,
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
                          Text('₹$minprice - ₹$maxprice',
                              style: apptextstyle(
                                  color: AppColors.black,
                                  size: size.width / 40,
                                  weight: FontWeight.w200)),
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
                          size: size,
                          activecolor: AppColors.black,
                          appcolor: AppColors.black,
                          istrue: false,
                          ontap: (val) {
                            ac = val;
                          },
                          text: 'Ac')),
                  Expanded(
                      child: CheckBoxWidget(
                          size: size,
                          activecolor: AppColors.black,
                          appcolor: AppColors.black,
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
                          size: size,
                          activecolor: AppColors.black,
                          appcolor: AppColors.black,
                          istrue: false,
                          ontap: (val) {
                            swimmingpool = val;
                          },
                          text: 'Swimming pool')),
                  Expanded(
                      child: CheckBoxWidget(
                          size: size,
                          activecolor: AppColors.black,
                          appcolor: AppColors.black,
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
                          size: size,
                          activecolor: AppColors.black,
                          appcolor: AppColors.black,
                          istrue: false,
                          ontap: (val) {
                            spa = val;
                          },
                          text: 'Spa Center')),
                  Expanded(
                      child: CheckBoxWidget(
                          size: size,
                          activecolor: AppColors.black,
                          appcolor: AppColors.black,
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
                          size: size,
                          activecolor: AppColors.black,
                          appcolor: AppColors.black,
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
                        child: Center(
                          child: Text('Category',
                              style: apptextstyle(
                                  color: AppColors.black,
                                  size: 15,
                                  weight: FontWeight.w200)),
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
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text('Filter',
                          style: apptextstyle(
                              color: AppColors.white,
                              size: 15,
                              weight: FontWeight.w200)),
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
