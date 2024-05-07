import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/firebase/get_functions.dart';

carouselWidget({required Size size, required Map<String, dynamic> details}) {
  return Column(
    children: [
      SizedBox(
        height: size.height / 2.4,
        width: size.width,
        child: FutureBuilder<List>(
          future: getVillas(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: SizedBox(
                height: 55,
                width: 55,
                child: CircularProgressIndicator(
                  color: AppColors.white,
                ),
              ));
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final villa = snapshot.data?.firstWhere(
                (element) => element.id == details['id'],
              );
              return SizedBox(
                height: size.height / 2.4,
                width: size.width,
                child: FlutterCarousel(
                  options: CarouselOptions(
                    indicatorMargin: 45,
                    viewportFraction: 1.0,
                    showIndicator: true,
                    slideIndicator: const CircularSlideIndicator(),
                  ),
                  items: villa['images'].map<Widget>((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.network(
                          i,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                child: SizedBox(
                                  height: 55,
                                  width: 55,
                                  child: CircularProgressIndicator(
                                    color: AppColors.white,
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                  }).toList(),
                ),
              );
            }
          },
        ),
      ),
      SizedBox(
        height: size.height - (size.height / 2.4),
        width: size.width,
      ),
    ],
  );
}


