import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/firebase/user.dart';
import 'package:kalliyath_villa/model/message.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

messageWidget(
    {required bool istrue, required Size size, required Message message}) {
  return Column(
    crossAxisAlignment:
        istrue == true ? CrossAxisAlignment.start : CrossAxisAlignment.end,
    children: [
      Row(
        crossAxisAlignment:
            istrue == true ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        mainAxisAlignment:
            istrue ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (istrue == true)
            Padding(
              padding: const EdgeInsets.only(left: 7, top: 10),
              child: CircleAvatar(
                radius: size.width / 30,
                backgroundImage: const AssetImage('assets/images/user.png'),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(
                left: istrue == true ? 5 : 0,
                top: 10,
                bottom: 10,
                right: istrue == true ? 10 : 5),
            child: Container(
                constraints:
                    BoxConstraints(minWidth: 0, maxWidth: size.width / 1.7),
                decoration: BoxDecoration(
                    color: istrue == false
                        ? const Color.fromARGB(255, 13, 40, 58)
                        : const Color.fromARGB(255, 6, 115, 193),
                    borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(10),
                        bottomRight: Radius.circular(istrue == true ? 10 : 0),
                        topLeft: Radius.circular(istrue == false ? 10 : 0),
                        topRight: const Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: istrue == true
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 5, left: 15, right: 15),
                      child: Text(
                        message.content,
                        maxLines: 100,
                        overflow: TextOverflow.ellipsis,
                        style: apptextstyle(
                            color: AppColors.white,
                            size: 14,
                            weight: FontWeight.normal,
                            family: 'Kalliyath'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                        bottom: 5,
                      ),
                      child: SizedBox(
                        width: size.width / 6.7,
                        child: Row(
                          children: [
                            Text(
                              DateFormat('h:mm a').format(message.sentTime),
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: apptextstyle(
                                  color: AppColors.white,
                                  size: size.width / 50,
                                  weight: FontWeight.normal,
                                  family: 'Kalliyath'),
                            ),
                            if (istrue == false)
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 3,
                                ),
                                child: Icon(
                                  Icons.done,
                                  size: size.width / 30,
                                  color: AppColors.white,
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          if (istrue != true)
            Padding(
              padding: const EdgeInsets.only(right: 7, bottom: 10),
              child: CircleAvatar(
                radius: size.width / 30,
                backgroundImage: appuserphoto == ''
                    ? const AssetImage('assets/images/user (1).png')
                    : NetworkImage(appuserphoto) as ImageProvider,
                backgroundColor: AppColors.black,
              ),
            ),
        ],
      ),
    ],
  );
}
