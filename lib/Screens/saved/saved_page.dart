import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/home_screen/grid_tile/like_button.dart';
import 'package:kalliyath_villa/firebase/get_functions.dart';
import 'package:kalliyath_villa/Screens/saved/bloc/saved_bloc.dart';
import 'package:kalliyath_villa/Screens/saved/functions.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/villa_details.dart';

SavedBloc savedbloc = SavedBloc();

class SavedPage extends StatelessWidget {
  SavedPage({super.key});
  final SavedBloc savedblocrefresh = SavedBloc();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 10, 19),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 10, 19),
        centerTitle: true,
        title: const Text(
          'Saved',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Kalliyath',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: BlocBuilder<SavedBloc, SavedState>(
          bloc: savedbloc,
          builder: (context, state) {
            if (state is SavedbuildState) {
              print('saved builded');
              return Padding(
                padding: const EdgeInsets.all(10),
                child: state.saveddetails.isEmpty
                    ? SizedBox(
                        height: size.height - 95,
                        child: const Center(
                          child: Text(
                            'No villas',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 15,
                              fontFamily: 'Kalliyath2',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemCount: state.saveddetails.length,
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemBuilder: (ctx, index) {
                          final details = state.saveddetails[index];
                          final image = details['images'];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => VillaDetailsPage(
                                        details: details,
                                      )));
                            },
                            child: Container(
                              height: size.height / 3.3,
                              width: size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(image[0]),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 21,
                                        child: IconButton(
                                          icon: const Icon(
                                            EvaIcons.heart,
                                            color:
                                                Color.fromARGB(255, 255, 0, 0),
                                          ),
                                          onPressed: () {
                                            savedlikebuttonupdate(
                                                details['id'], false);
                                            savedbloc.add(Savedbuild());
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    height: size.height / 12,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: Text(
                                              details['name'],
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontFamily: 'Kalliyath2',
                                                fontWeight: FontWeight.w600,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 2, left: 6, right: 16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Image(
                                                      height: 17,
                                                      width: 17,
                                                      image: AssetImage(
                                                          'assets/images/star (1).png'),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      details['totalstar']
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Kalliyath2',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      '${details['reviews'].length} Reviews',
                                                      style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            155, 0, 0, 0),
                                                        fontSize: 16,
                                                        fontFamily:
                                                            'Kalliyath2',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      details['price'],
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'Kalliyath2',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    const Text(
                                                      '/night',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontFamily:
                                                            'Kalliyath2',
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
              );
            }
            return Container();
          }),
    );
  }
}
