import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

carouselWidget({required Size size, required Map<String, dynamic> details}) {
  return Column(
    children: [
      SizedBox(
        height: size.height / 2.4,
        width: size.width,
        child: FlutterCarousel(
          options: CarouselOptions(
            viewportFraction: 1.0,
            showIndicator: true,
            slideIndicator: const CircularSlideIndicator(),
          ),
          items: details['images'].map<Widget>((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                      image: NetworkImage(i),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
      SizedBox(
        height: size.height - (size.height / 2.4),
        width: size.width,
      ),
    ],
  );
}
