import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/saved/bloc/saved_bloc.dart';
import 'package:kalliyath_villa/Screens/saved/saved_tile.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

SavedBloc savedbloc = SavedBloc();

class SavedPage extends StatelessWidget {
  SavedPage({super.key});
  final SavedBloc savedblocrefresh = SavedBloc();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.darkblue,
        appBar: AppBar(
          backgroundColor: AppColors.darkblue,
          centerTitle: true,
          title: Text('Saved',
              style: apptextstyle(
                  color: AppColors.white, size: 20, family: 'Kalliyath')),
        ),
        body: SavedTile(size: size));
  }
}
