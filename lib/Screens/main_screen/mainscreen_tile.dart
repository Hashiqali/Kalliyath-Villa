import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/homescreen.dart';
import 'package:kalliyath_villa/Screens/main_screen/bloc/main_bloc.dart';
import 'package:kalliyath_villa/Screens/profile/profile.dart';
import 'package:kalliyath_villa/Screens/saved/saved_page.dart';
import 'package:kalliyath_villa/colors/colors.dart';

MainBloc navigationcontroll = MainBloc();
bool navigationbool = true;
Widget mainTaile({required MainBloc bloc, required Size size}) {
  int currentidx = 0;
  return BlocBuilder<MainBloc, MainState>(
    bloc: bloc,
    builder: (context, state) {
      return Stack(
        children: [
          IndexedStack(
            index: currentidx,
            children: _widgetOptions,
          ),
          BlocBuilder<MainBloc, MainState>(
            bloc: navigationcontroll,
            builder: (context, state) {
              return AnimatedOpacity(
                opacity: navigationbool ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Visibility(
                  visible: navigationbool,
                  child: Align(
                    heightFactor: size.height / 59,
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
                          selectedItemColor: AppColors.black,
                          onTap: (x) {
                            currentidx = x;
                            bloc.add(NavigationbarBuilder());
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}

List<Widget> _widgetOptions = <Widget>[
  const HomeScreen(),
  SavedPage(),
  const ProfilePage()
];
