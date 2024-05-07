import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/home_tile/home_tile.dart';
import 'package:kalliyath_villa/Screens/search/search.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

final HomeBloc homebloc = HomeBloc();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc bloc = HomeBloc();
  final HomeBloc bloc1 = HomeBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(children: [
      Scaffold(
          backgroundColor: AppColors.darkblue,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'Home',
              style: apptextstyle(
                  color: AppColors.white, size: 20, family: 'Kalliyath'),
            ),
            centerTitle: true,
          ),
          body: HomeTile(size: size)),
      const Search()
    ]);
  }
}
