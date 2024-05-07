import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/widget/like_button_widget.dart/like_button_widget.dart';
import 'package:kalliyath_villa/Screens/home_screen/homescreen.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/bloc/details_bloc.dart';

stackbuttons(
    {required BuildContext context, required Map<String, dynamic> details}) {
  DetailsBloc detailsbloclikebutton = DetailsBloc();
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    size: 28,
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 0, 0, 0),
                  )),
            ),
            BlocBuilder<DetailsBloc, DetailsState>(
              bloc: detailsbloclikebutton,
              builder: (context, state) {
                bool istrue = details['saved'];
                if (state is LikebuttonclickState1) {
                  istrue = false;
                } else if (state is LikebuttonclickState2) {
                  istrue = true;
                }
                return CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: IconButton(
                      onPressed: () async {
                        detailsbloclikebutton
                            .add(Likebuttonclick(istrue: istrue));
                        await likeGridbuttonupdate(details['id'], istrue);
                        homebloc.add(Homerebuild());
                      },
                      icon: Icon(
                        istrue == true ? EvaIcons.heart : EvaIcons.heartOutline,
                        color: istrue == true
                            ? const Color.fromARGB(255, 255, 18, 1)
                            : Colors.black,
                      )),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
