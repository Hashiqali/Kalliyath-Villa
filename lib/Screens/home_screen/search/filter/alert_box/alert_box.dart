import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/home_screen/search/filter/check_box/check_box.dart';
import 'package:kalliyath_villa/Screens/home_screen/search/filter/controller/filter_controller.dart';
import 'package:kalliyath_villa/firebase/functions.dart';

List<Map<String, dynamic>> categoriesfiltered = [];

alertbox({required BuildContext context, required Size size}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Categories',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Kalliyath2',
            fontWeight: FontWeight.w200,
          ),
        ),
        content: SizedBox(
          width: size.width,
          height: size.height / 5,
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: getfirebasedetails('Categories'),
            builder: (BuildContext context,
                AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<Map<String, dynamic>> data = snapshot.data!;

                
                return Scrollbar(
                  radius: const Radius.circular(5),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      itemBuilder: (ctx, index) {
                        final category = data[index];
                        return CheckBoxWidget(
                          istrue: false,
                          ontap: (val) {
                            if (categoriesfilteredselected
                                .contains(category['category'])) {
                              categoriesfilteredselected
                                  .remove(category['category']);
                            } else {
                              categoriesfilteredselected
                                  .add(category['category']);
                            }
                          },
                          text: category['category'],
                        );
                      }),
                );
              }
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              categoriesfilteredselected.clear();
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 13,
                fontFamily: 'Kalliyath2',
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              print(categoriesfilteredselected);
              Navigator.pop(context);
            },
            child: const Text(
              'Add',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 13,
                fontFamily: 'Kalliyath2',
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ],
      );
    },
  );
}


