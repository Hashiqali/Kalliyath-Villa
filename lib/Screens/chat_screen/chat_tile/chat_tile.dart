import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kalliyath_villa/Screens/chat_screen/bloc/chat_bloc.dart';
import 'package:kalliyath_villa/Screens/chat_screen/message_widget/functions.dart';
import 'package:kalliyath_villa/Screens/chat_screen/message_widget/message_widget.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/firebase/chat_api.dart';
import 'package:kalliyath_villa/firebase/user.dart';
import 'package:kalliyath_villa/model/message.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

chatTile({
  required Size size,
  required TextEditingController messagecontroller,
}) {
  ChatBloc blocexpand = ChatBloc();
  bool istrue = false;

  ScrollController scrollController = ScrollController();

  return Column(
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: StreamBuilder<List<Message>>(
            stream: ChatController().getMessages(appuserid),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<Message> messages = snapshot.data ?? [];

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                });

                return ListView.separated(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    final message = messages[index];
                    final bool side =
                        message.senderId == 'admin1234' ? true : false;
                    if (index == 0 ||
                        !isSameDay(
                            message.sentTime, messages[index - 1].sentTime)) {
                      return Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              getMessageDate(message.sentTime),
                              style: const TextStyle(
                                color: Colors
                                    .grey, 
                              ),
                            ),
                          ),
                          messageWidget(
                            istrue: side,
                            size: size,
                            message: message,
                          ),
                        ],
                      );
                    } else {
                      return messageWidget(
                        istrue: side,
                        size: size,
                        message: message,
                      );
                    }
                  },
                  separatorBuilder: (ctx, index) => const SizedBox(height: 5),
                  itemCount: messages.length,
                );
              }
            },
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: BlocBuilder<ChatBloc, ChatState>(
          bloc: blocexpand,
          builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      top: 15,
                      bottom: 20,
                      right: istrue == false ? 15 : 0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            istrue = true;
                          } else {
                            istrue = false;
                          }
                          blocexpand.add(MessageBoxExapand());
                        },
                        controller: messagecontroller,
                        minLines: 1,
                        cursorColor: AppColors.white,
                        style: apptextstyle(
                          color: AppColors.white,
                          size: 16,
                          family: 'Kalliyath2',
                          weight: FontWeight.normal,
                        ),
                        maxLines: 3,
                        decoration: InputDecoration(
                          filled: true,
                          hintText: "Type your message...",
                          hintStyle: apptextstyle(
                            family: 'Kalliyath2',
                            color: AppColors.white,
                            size: 14,
                          ),
                          hoverColor: Colors.transparent,
                          fillColor: const Color.fromARGB(255, 58, 61, 64),
                          focusColor: Colors.transparent,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (istrue == true)
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: size.height / 14.5,
                          child: Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () {
                                if (messagecontroller.text.isNotEmpty &&
                                    messagecontroller.text.trim() != '') {
                                  sendMessage(
                                      userid: appuserid,
                                      content: messagecontroller);
                                }
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: const Icon(
                                Icons.send,
                                color: Color.fromARGB(210, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            );
          },
        ),
      ),
    ],
  );
}
