import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalliyath_villa/firebase/user.dart';
import 'package:kalliyath_villa/model/message.dart';
import 'package:kalliyath_villa/model/user.dart';

class ChatController {
  Future<List<UserModel>> getAllUsers() async {
    List<UserModel> result = [];

    final firedata = FirebaseFirestore.instance.collection('signup');

    QuerySnapshot querySnapshot = await firedata.get();

    List<Map<String, dynamic>> dataList = [];

    for (var doc in querySnapshot.docs) {
      if (doc.exists) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
        if (data != null) {
          data['id'] = doc.id;
          dataList.add(data);
        }
      }
    }

    result = dataList.map((e) => UserModel.fromJson(e)).toList();
    return result;
  }

  static Future<void> updateUserData(Map<String, dynamic> data) async =>
      await FirebaseFirestore.instance
          .collection('signup')
          .doc(appuserid)
          .update(data);

  Stream<List<Message>> getMessages(String receiverId) async* {
    try {
      final messagesSnapshot = FirebaseFirestore.instance
          .collection('signup')
          .doc('admin1234')
          .collection('chat')
          .doc(receiverId)
          .collection('messages')
          .orderBy('sentTime', descending: false)
          .snapshots(includeMetadataChanges: true);

      await for (final messages in messagesSnapshot) {
        final messagesList =
            messages.docs.map((e) => Message.fromJson(e.data())).toList();

        yield messagesList;
      }
    } catch (e) {
      log('Error fetching messages: $e');
      yield [];
    }
  }
}
