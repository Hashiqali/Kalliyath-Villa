import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/functions.dart';
import 'package:kalliyath_villa/Screens/home_screen/grid_tile/grid_tile.dart';
import 'package:kalliyath_villa/Screens/home_screen/homescreen.dart';
import 'package:kalliyath_villa/Screens/home_screen/main_tile/main_tile.dart';
import 'package:kalliyath_villa/Screens/main_screen/bloc/main_bloc.dart';
import 'package:kalliyath_villa/Screens/main_screen/mainscreen_tile.dart';
import 'package:kalliyath_villa/Screens/search/search_tile.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/villa_details.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

class HomeTile extends StatefulWidget {
  const HomeTile({super.key, required this.size});

  final Size size;

  @override
  State<HomeTile> createState() => _HomeTileState();
}

class _HomeTileState extends State<HomeTile> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= widget.size.height / 50) {
      navigationbool = false;
      navigationcontroll.add(NavigationOnOff());
    } else {
      navigationbool = true;
      navigationcontroll.add(NavigationOnOff());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: homebloc,
      builder: (context, state) {
        if (state is HomerebuildState) {
          return RefreshIndicator(
            color: AppColors.black,
            onRefresh: () {
              return refresh(homebloc);
            },
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: state.vllaDetails.isEmpty
                    ? Center(
                        child: Text(
                          'No villas',
                          style: apptextstyle(color: AppColors.white, size: 15),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Container(
                          height: state.vllaDetails.length > 4
                              ? null
                              : widget.size.height - 50,
                          color: AppColors.darkblue,
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: widget.size.height / 12),
                              maintilewidget(
                                  context: context,
                                  size: widget.size,
                                  details: state.vllaDetails.last),
                              SizedBox(height: widget.size.height / 50),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.vllaDetails.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 15.0,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  final details = state.vllaDetails[index];

                                  return GestureDetector(
                                    onTap: () async {
                                      focusNodeSearch.unfocus();
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  VillaDetailsPage(
                                                      details: details)));
                                    },
                                    child: GridTileWidget(
                                      size: widget.size,
                                      details: details,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          );
        } else if (state is SearchGridbuilderState) {
          return state.filtereditems.isEmpty
              ? Center(
                  child: Text(
                    'No Villa',
                    style: apptextstyle(color: AppColors.white, size: 15),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 65, left: 10, right: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.filtereditems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 15.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final details = state.filtereditems[index];

                      return GestureDetector(
                        onTap: () async {
                          focusNodeSearch.unfocus();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => VillaDetailsPage(
                                    details: details,
                                  )));
                        },
                        child: GridTileWidget(
                          size: widget.size,
                          details: details,
                        ),
                      );
                    },
                  ),
                );
        } else if (state is FilterGridbuilderState) {
          return state.filtereditems.isEmpty
              ? Center(
                  child: Text(
                    'No villas',
                    style: apptextstyle(color: AppColors.white, size: 15),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 15, top: 5),
                          child: GestureDetector(
                            onTap: () async {
                              homebloc.add(Homerebuild());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              height: widget.size.height / 25,
                              width: widget.size.width / 4,
                              child: Center(
                                child: Text(
                                  'Clear filter',
                                  style: apptextstyle(
                                      color: AppColors.white, size: 15),
                                ),
                              ),
                            ),
                          )),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.filtereditems.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 15.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final details = state.filtereditems[index];

                          return GestureDetector(
                            onTap: () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => VillaDetailsPage(
                                        details: details,
                                      )));
                            },
                            child: GridTileWidget(
                              size: widget.size,
                              details: details,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
        }
        return Container();
      },
    );
  }
}
