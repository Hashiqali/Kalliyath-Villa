import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/homescreen.dart';
import 'package:kalliyath_villa/Screens/main_screen/bloc/main_bloc.dart';
import 'package:kalliyath_villa/Screens/main_screen/main_tile.dart';
import 'package:kalliyath_villa/Screens/saved/bloc/saved_bloc.dart';
import 'package:kalliyath_villa/Screens/saved/saved_page.dart';

class ManiScreen extends StatefulWidget {
  const ManiScreen({super.key});

  @override
  State<ManiScreen> createState() => _ManiScreenState();
}

Map<String, dynamic> value = {};

class _ManiScreenState extends State<ManiScreen> {
  MainBloc bloc = MainBloc();
  @override
  void initState() {
    homebloc.add(Homerebuild());
    savedbloc.add(Savedbuild());
    bloc.add(NavigationbarBuilder());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(body: mainTaile(bloc: bloc,size: size));
  }
}
