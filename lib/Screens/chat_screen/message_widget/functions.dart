import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kalliyath_villa/model/message.dart';

sendMessage(
    {required String userid, required TextEditingController content}) async {
  final message = Message(
      senderId: userid,
      receiverId: 'admin1234',
      read: false,
      sentTime: DateTime.now(),
      content: content.text.trim());
  content.text = '';
  await addMessageTochat(
    userid: userid,
    message: message,
  );
}

addMessageTochat({required String userid, required message}) async {
  final firebase = FirebaseFirestore.instance;
  await firebase
      .collection('signup')
      .doc('admin1234')
      .collection('chat')
      .doc(userid)
      .collection('messages')
      .add(message.toJson());
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

String getMessageDate(DateTime date) {
  if (isSameDay(date, DateTime.now())) {
    return 'Today';
  } else if (isSameDay(
      date, DateTime.now().subtract(const Duration(days: 1)))) {
    return 'Yesterday';
  } else {
    return DateFormat.yMMMMd().format(date);
  }
}
