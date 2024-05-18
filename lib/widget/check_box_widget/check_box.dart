import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/search/bloc/search_bloc.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

// ignore: must_be_immutable
class CheckBoxWidget extends StatefulWidget {
  CheckBoxWidget(
      {super.key,
      this.checkcolor,
      required this.appcolor,
      required this.istrue,
      required this.ontap,
      required this.text,
      required this.activecolor,
      required this.size});
  final Function ontap;
  final bool istrue;
  final String text;
  final Color appcolor;
  final Color activecolor;
  bool? checkcolor = false;
  final Size size;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  final SearchBloc checkboxbloc = SearchBloc();
  bool istrue = false;

  @override
  void initState() {
    istrue = widget.istrue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: checkboxbloc,
      builder: (context, state) {
        if (state is CheckboxbulderclickedState) {
          istrue = true;
        } else if (state is CheckboxbulderclickState) {
          istrue = false;
        }
        return CheckboxListTile(
          title: Text(widget.text,
              style: apptextstyle(
                  color: widget.appcolor,
                  size: widget.size.width / 35,
                  family: 'Kalliyath')),
          activeColor: widget.activecolor,
          checkColor:
              widget.checkcolor != true ? AppColors.white : AppColors.black,
          value: istrue,
          onChanged: (value) {
            widget.ontap(value);
            checkboxbloc.add(Checkboxbulder(istrue: istrue));
          },
        );
      },
    );
  }
}
