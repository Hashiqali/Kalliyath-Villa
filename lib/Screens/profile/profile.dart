import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/profile/image_tile/image_tile.dart';
import 'package:kalliyath_villa/Screens/profile/profile_tile.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    bloc1.add(LoginUpdateEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: imageTile(size: size),
      body: profileTile(size: size, context: context),
    );
  }
}
