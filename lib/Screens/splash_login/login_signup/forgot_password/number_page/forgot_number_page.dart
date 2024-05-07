import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/forgot_password/number_page/number_page_Tile/number_page_tile.dart';

class ForgotPhoneNumberPage extends StatelessWidget {
  ForgotPhoneNumberPage({super.key});
  final TextEditingController phoneNumbercontroller = TextEditingController();
  final GlobalKey<FormState> phoneNumberkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: numberPageTile(
            size: size,
            phoneNumbercontroller: phoneNumbercontroller,
            phoneNumberkey: phoneNumberkey,
            context: context));
  }
}
