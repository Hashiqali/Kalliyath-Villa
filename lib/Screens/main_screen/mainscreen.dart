import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/homescreen.dart';
import 'package:kalliyath_villa/Screens/main_screen/bloc/main_bloc.dart';
import 'package:kalliyath_villa/Screens/main_screen/mainscreen_tile.dart';
import 'package:kalliyath_villa/Screens/saved/bloc/saved_bloc.dart';
import 'package:kalliyath_villa/Screens/saved/saved_page.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';

class ManiScreen extends StatefulWidget {
  const ManiScreen({super.key});

  @override
  State<ManiScreen> createState() => _ManiScreenState();
}

class _ManiScreenState extends State<ManiScreen> {
  MainBloc bloc = MainBloc();
  @override
  void initState() {
    homebloc.add(Homerebuild());
    savedbloc.add(Savedbuild());
    bloc.add(NavigationbarBuilder());
    bloc1.add(LoginUpdateEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(body: mainTaile(bloc: bloc, size: size));
  }
}
