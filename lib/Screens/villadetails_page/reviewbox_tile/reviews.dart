import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/bloc/details_bloc.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/functions.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/review_tile.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

final DetailsBloc revirewbuilderbloc = DetailsBloc();

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key, required this.details});
  final Map<String, dynamic> details;

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  initState() {
    revirewbuilderbloc.add(Reviewbuilder(id: widget.details['id']));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text('Customer Reviews',
            style: apptextstyle(
                color: AppColors.white, size: 17, weight: FontWeight.w600)),
      ),
      body: reviewTile(context: context, size: size, details: widget.details),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  void dispose() {
    totalstar = 0;
    fivestar = 0;
    fourstar = 0;
    threestar = 0;
    twostar = 0;
    onestar = 0;
    super.dispose();
  }
}
