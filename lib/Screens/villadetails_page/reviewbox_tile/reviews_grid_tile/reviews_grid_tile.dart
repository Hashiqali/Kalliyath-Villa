import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/reviewbox_tile/functions.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/firebase/user.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

reviewGridTile(
    {required Size size,
    required data,
    required reviews,
    required BuildContext context}) {
  return Expanded(
      child: Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: data['reviews'].isEmpty
        ? Center(
            child: Text('No Reviews',
                style: apptextstyle(
                    color: AppColors.white, size: 14, weight: FontWeight.w100)),
          )
        : ListView.separated(
            itemBuilder: (ctx, index) {
              final values = reviews[index];
              final star = double.parse(values['star']).round();

              final messege = getMessage(star);
              return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                    radius: 11,
                                    backgroundImage: data['appuserimage'] == ""
                                        ? const AssetImage(
                                                'assets/images/user.png')
                                            as ImageProvider
                                        : NetworkImage(values['appuserimage'])),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 2, left: 7),
                                  child: Text(values['appusername'],
                                      style: apptextstyle(
                                          color: AppColors.white,
                                          size: 12,
                                          weight: FontWeight.w100)),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: values['appusername'] == appusername,
                              child: IconButton(
                                  onPressed: () {
                                    deletereviews(
                                        context: context,
                                        size: size,
                                        id: data['id'],
                                        value: values,
                                        reviews: reviews);
                                  },
                                  icon: const Icon(
                                    Icons.delete_forever_outlined,
                                    color: Color.fromARGB(120, 234, 42, 42),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Text(values['message'],
                          style: apptextstyle(
                              color: AppColors.white,
                              size: 13,
                              weight: FontWeight.w100)),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 5, left: 0, top: 2),
                            child: SizedBox(
                              width: size.width / 4.5,
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 5,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  crossAxisSpacing: .0,
                                  mainAxisSpacing: 0.0,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  Color color = Colors.white;
                                  if (star > index) {
                                    color =
                                        const Color.fromARGB(255, 236, 176, 24);
                                  } else {
                                    color = Colors.white;
                                  }

                                  return Icon(Icons.star_sharp,
                                      size: 17, color: color);
                                },
                              ),
                            ),
                          ),
                          Text(messege,
                              style: apptextstyle(
                                  color: AppColors.white,
                                  size: 12,
                                  weight: FontWeight.w100))
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider(
                thickness: .5,
                color: AppColors.white,
              );
            },
            itemCount: data['reviews'].length),
  ));
}
