import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/Homescreen/homescreen.dart';
import 'package:kalliyath_villa/Screens/firebase/functions.dart';
import 'package:kalliyath_villa/Screens/profile/profile.dart';
import 'package:kalliyath_villa/Screens/saved/saved_page.dart';
import 'package:kalliyath_villa/Screens/splash&login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash&login/splash/splash.dart';

class ManiScreen extends StatefulWidget {
  ManiScreen({super.key});

  @override
  State<ManiScreen> createState() => _ManiScreenState();
}

int currentidx = 0;

Map<String, dynamic> value = {};
List<Widget> _widgetOptions = <Widget>[
  HomeScreen(),
  const SavedPage(),
  ProfilePage()
];

class _ManiScreenState extends State<ManiScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: currentidx,
            children: _widgetOptions,
          ),
          Align(
            heightFactor: 14,
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 20,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.favorite,
                        size: 20,
                      ),
                      label: 'Saved',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        size: 20,
                      ),
                      label: 'Profile',
                    ),
                  ],
                  currentIndex: currentidx,
                  selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
                  onTap: (x) {
                    setState(() {
                      currentidx = x;
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
