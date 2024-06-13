import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

facilitiestile({required Map<String, dynamic> details, required Size size}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(
          top: size.height / 60,
          left: size.width / 15,
        ),
        child: Text(
          'Facilities',
          style: apptextstyle(
              color: AppColors.white,
              size: size.width / 25,
              weight: FontWeight.w600),
          overflow: TextOverflow.visible,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: size.width / 17,
          right: size.width / 17,
        ),
        child: GridView.builder(
          padding: const EdgeInsets.only(top: 10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: details['facilities'].length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: size.width / 40,
              mainAxisSpacing: size.width / 40,
              childAspectRatio: size.aspectRatio / .6),
          itemBuilder: (BuildContext context, int index) {
            final item = details['facilities'][index];

            return SizedBox(
              height: size.height / 6,
              width: size.width / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: size.height / 10.5,
                    width: size.width / 4,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(36, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image(
                        height: 35,
                        image: AssetImage(
                          item['image']!,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        item['name']!,
                        style: apptextstyle(
                            color: AppColors.white,
                            size: 11,
                            weight: FontWeight.w200),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      )
    ],
  );
}
