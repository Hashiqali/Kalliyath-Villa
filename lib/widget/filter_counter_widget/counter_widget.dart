import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/search/bloc/search_bloc.dart';
import 'package:kalliyath_villa/Screens/search/filter/controller/filter_controller.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

counterWidget({required Size size}) {
  SearchBloc counterbloc = SearchBloc();
  bhk = 1;

  void incrementCounter() {
    bhk++;
    counterbloc.add(BhkBuilder());
  }

  void decrementCounter() {
    if (bhk > 1) {
      bhk--;
      counterbloc.add(BhkBuilder());
    }
  }

  return Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    child: Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 219, 218, 218),
          borderRadius: BorderRadius.circular(10)),
      width: size.width,
      height: size.height / 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.remove,
              color: AppColors.black,
            ),
            onPressed: decrementCounter,
          ),
          BlocBuilder<SearchBloc, SearchState>(
            bloc: counterbloc,
            builder: (context, state) {
              return Text('BHK: $bhk',
                  style: apptextstyle(color: AppColors.black, size: 15));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: AppColors.black,
            ),
            onPressed: incrementCounter,
          ),
        ],
      ),
    ),
  );
}
