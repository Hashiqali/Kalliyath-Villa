import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/chat_screen/chat_tile/chat_tile.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/firebase/chat_api.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

class ChatScreenPage extends StatefulWidget {
  const ChatScreenPage({super.key});

  @override
  State<ChatScreenPage> createState() => _ChatScreenPageState();
}

class _ChatScreenPageState extends State<ChatScreenPage>
    with WidgetsBindingObserver {
  final TextEditingController messagecontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    ChatController.updateUserData({
      'lastActive': DateTime.now(),
      'isOnline': true,
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      ChatController.updateUserData({
        'lastActive': DateTime.now(),
        'isOnline': true,
      });
      return;
    } else if (state == AppLifecycleState.detached) {
      ChatController.updateUserData({'isOnline': false});
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    ChatController.updateUserData({'isOnline': false});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.black,
          centerTitle: true,
          title: Text('Customer Support',
              style: apptextstyle(
                  color: AppColors.white, family: 'Kalliyath', size: 20)),
        ),
        body: chatTile(size: size, messagecontroller: messagecontroller));
  }
}
