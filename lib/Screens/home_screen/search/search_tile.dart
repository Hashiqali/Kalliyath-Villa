import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/bloc/home_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/homescreen.dart';
import 'package:kalliyath_villa/Screens/home_screen/search/bloc/search_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/search/filter/filter_widget/filter_widget.dart';
import 'package:kalliyath_villa/Screens/home_screen/search/filter/functions.dart';

class SearchTileWidget extends StatefulWidget {
  const SearchTileWidget({
    super.key,
  });

  @override
  State<SearchTileWidget> createState() => _SearchTileWidgetState();
}

class _SearchTileWidgetState extends State<SearchTileWidget> {
  final SearchBloc searchvisiblebloc = SearchBloc();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    searchvisiblebloc.add(NotVisibleBuilder());
    homebloc.add(SearchGridbuilder(filtereditems: filtereditems));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
        heightFactor: size.height / 205,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: BlocBuilder<SearchBloc, SearchState>(
            bloc: searchvisiblebloc,
            builder: (context, state) {
              bool istrue = false;
              if (state is VisibleBuilderState) {
                istrue = true;
              } else if (state is NotVisibleBuilderState) {
                istrue = false;
              }
              return Row(
                children: [
                  Visibility(
                      visible: istrue,
                      child: IconButton(
                          onPressed: () {
                            controller.text = '';
                            homebloc.add(Homerebuild());
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_sharp,
                            color: Colors.white,
                          ))),
                  SizedBox(
                    width: istrue == false ? size.width - 20 : size.width - 70,
                    child: TextFormField(
                        controller: controller,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            searchvisiblebloc.add(VisibleBuilder());
                          } else {
                            searchvisiblebloc.add(NotVisibleBuilder());
                          }
                          return;
                        },
                        onChanged: (value) {
                          filterItems(value, '');
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search_outlined),
                          suffixIcon: IconButton(
                            icon: const Icon(EvaIcons.options2),
                            onPressed: () {
                              filterwidget(context: context, size: size);
                            },
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 240, 238, 238),
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                            fontFamily: 'Kalliyath1',
                            color: Color.fromARGB(210, 158, 158, 158),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 240, 238, 238),
                              width: 2.0,
                            ),
                          ),
                        )),
                  ),
                ],
              );
            },
          ),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
