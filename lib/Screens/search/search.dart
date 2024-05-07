import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/homescreen.dart';
import 'package:kalliyath_villa/Screens/search/bloc/search_bloc.dart';
import 'package:kalliyath_villa/Screens/search/filter/functions.dart';
import 'package:kalliyath_villa/Screens/search/search_tile.dart';

class Search extends StatefulWidget {
  const Search({
    super.key,
  });

  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search> {
  final SearchBloc searchvisiblebloc = SearchBloc();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    searchvisiblebloc.add(NotVisibleBuilder());
    homebloc.add(SearchGridbuilder(filtereditems: filtereditems));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return searchTile(
        size: size,
        searchvisiblebloc: searchvisiblebloc,
        controller: controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
