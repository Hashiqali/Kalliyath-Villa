import 'package:flutter/material.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:kalliyath_villa/widget/like_button_widget.dart/like_button_widget.dart';

class GridTileWidget extends StatelessWidget {
  const GridTileWidget({
    super.key,
    required this.size,
    required this.details,
  });
  final Size size;

  final Map<String, dynamic> details;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                details['images'].first,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Center(
                        child: SizedBox(
                          height: 55,
                          width: 55,
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: size.height / 25,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: size.width / 7,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Image(
                                height: 13,
                                width: 13,
                                image: AssetImage('assets/images/star (1).png'),
                              ),
                              Text(
                                  details['totalstar'] == 0 ||
                                          details['totalstar'].toString() ==
                                              'NaN'
                                      ? '0.0'
                                      : details['totalstar']
                                          .toString()
                                          .substring(0, 3),
                                  style: apptextstyle(
                                      color: AppColors.black, size: 15)),
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                          backgroundColor: AppColors.white,
                          radius: 18,
                          child: likebuttonwidget(
                            details: details,
                            id: details['id'],
                          )),
                    ],
                  ),
                ),
                Container(
                  height: size.height / 20,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                details['name'],
                                style: apptextstyle(
                                    color: AppColors.black,
                                    size: 13,
                                    weight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '₹${details['price']}',
                                      style: apptextstyle(
                                          color: AppColors.black, size: 16),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
