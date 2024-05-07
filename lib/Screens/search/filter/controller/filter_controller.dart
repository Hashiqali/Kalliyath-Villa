import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/homescreen.dart';

String minprice = '2500';
String maxprice = '10000';
int bhk = 1;
bool ac = false;
bool playground = false;
bool swimmingpool = false;
bool fitness = false;
bool spa = false;
bool tv = false;
bool wifi = false;
List<String> categoriesfilteredselected = [];
List<Map<String, dynamic>> allCategories = [];
List<Map<String, dynamic>> filterItems(
  List<Map<String, dynamic>> items,
  String minPrice,
  String maxPrice,
  String bhk,
  bool ac,
  bool playground,
  bool swimmingpool,
  bool fitness,
  bool spa,
  bool tv,
  bool wifi,
  List<String> list,
  BuildContext context,
) {
  List<Map<String, dynamic>> filteredItems = items.where((item) {
    double itemPrice = double.tryParse(item['price'].toString()) ?? 0;
    if ((minPrice.isNotEmpty && itemPrice < double.parse(minPrice)) ||
        (maxPrice.isNotEmpty && itemPrice > double.parse(maxPrice))) {
      return false;
    }

    if (bhk != '0' && item['bhk'] != bhk) {
      return false;
    }

    if (ac && !item['ac']) {
      return false;
    }
    if (playground && !item['playground']) {
      return false;
    }
    if (swimmingpool && !item['swimmingpool']) {
      return false;
    }
    if (fitness && !item['fitness']) {
      return false;
    }
    if (spa && !item['spa']) {
      return false;
    }
    if (tv && !item['tv']) {
      return false;
    }
    if (wifi && !item['wifi']) {
      return false;
    }

    if (list.isNotEmpty) {
      for (var category in list) {
        if (item['type'].contains(category)) {
          return true;
        }
      }

      return false;
    }

    return true;
  }).toList();

  Navigator.pop(context);
  homebloc.add(FilterGridbuilder(filtereditems: filteredItems));
  categoriesfilteredselected.clear();

  return filteredItems;
}

