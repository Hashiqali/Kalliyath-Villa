import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/search/bloc/search_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/search/filter/controller/filter_controller.dart';

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
              color: Colors.black,
            ),
            onPressed: decrementCounter,
          ),
          BlocBuilder<SearchBloc, SearchState>(
            bloc: counterbloc,
            builder: (context, state) {
              return Text(
                'BHK: $bhk',
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                  fontFamily: 'Kalliyath2',
                  fontWeight: FontWeight.w400,
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: incrementCounter,
          ),
        ],
      ),
    ),
  );
}
