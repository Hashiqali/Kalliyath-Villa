import 'package:flutter/material.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:kalliyath_villa/widget/check_box_widget/check_box.dart';
import 'package:kalliyath_villa/Screens/search/filter/controller/filter_controller.dart';
import 'package:kalliyath_villa/firebase/functions.dart';

alertbox({required BuildContext context, required Size size}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Categories',
            style: apptextstyle(
                color: AppColors.black, size: 15, weight: FontWeight.w200)),
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
                          activecolor: AppColors.black,
                          size: size,
                          appcolor: AppColors.black,
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
            child: Text('Cancel',
                style: apptextstyle(
                    color: AppColors.black, size: 13, weight: FontWeight.w200)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Add',
                style: apptextstyle(
                    color: AppColors.black, size: 13, weight: FontWeight.w200)),
          ),
        ],
      );
    },
  );
}
