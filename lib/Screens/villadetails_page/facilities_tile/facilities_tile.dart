import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

facilitiestile({required Map<String, dynamic> details, required Size size}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: 25,
        ),
        child: Text(
          'Facilities',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 16,
            fontFamily: 'Kalliyath2',
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.visible,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: details['facilities'].length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5.0,
              childAspectRatio: .8),
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
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 11,
                          fontFamily: 'Kalliyath2',
                          fontWeight: FontWeight.w200,
                        ),
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
