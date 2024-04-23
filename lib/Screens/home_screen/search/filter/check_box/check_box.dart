import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/search/bloc/search_bloc.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget(
      {super.key,
      required this.istrue,
      required this.ontap,
      required this.text});
  final Function ontap;
  final bool istrue;
  final String text;
  final SearchBloc checkboxbloc = SearchBloc();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: checkboxbloc,
      builder: (context, state) {
        bool istrue = false;
        if (state is CheckboxbulderclickedState) {
          istrue = true;
        } else if (state is CheckboxbulderclickState) {
          istrue = false;
        }
        return CheckboxListTile(
          title: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: "Kalliyath",
              fontSize: 13,
            ),
          ),
          activeColor: Colors.black,
          value: istrue,
          onChanged: (value) {
            ontap(value);
            checkboxbloc.add(Checkboxbulder(istrue: istrue));
          },
        );
      },
    );
  }
}
