import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/main_tile/home_tile.dart';
import 'package:kalliyath_villa/Screens/home_screen/search/search_tile.dart';



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
          backgroundColor: const Color.fromARGB(255, 1, 10, 19),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Kalliyath',
                fontWeight: FontWeight.w400,
              ),
            ),
            centerTitle: true,
          ),
          body: HomeTile(size: size)),
      SearchTileWidget()
    ]);
  }
}
