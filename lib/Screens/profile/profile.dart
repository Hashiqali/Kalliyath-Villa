import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/profile/ProfiteTile.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/login/functions.dart';
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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(size.width, size.height / 3.9),
          child: BlocBuilder<SplashLoginBloc, SplashLoginState>(
            bloc: bloc1,
            builder: (context, state) {
              if (state is LoginUpdatestate) {
                return Container(
                  color: const Color.fromARGB(255, 39, 39, 39),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            height: 100,
                            fit: BoxFit.cover,
                            width: 100,
                            imageUrl: userData['Image'],
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 39, 39, 39),
                              backgroundImage:
                                  AssetImage('assets/images/user (1).png'),
                              radius: 47,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            userData['Username'],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Kalliyath2',
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          )),
      body: SingleChildScrollView(
        child: Container(
          height: size.height / 1.4,
          width: size.width,
          color: const Color.fromARGB(255, 1, 10, 19),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ProfieTile(
                    function: () {},
                    image: 'assets/images/user (1).png',
                    size: size,
                    text: 'Personal Information',
                    istrue: false),
                ProfieTile(
                    function: () {},
                    image: 'assets/images/luggage.png',
                    size: size,
                    text: 'Bookings',
                    istrue: false),
                ProfieTile(
                    function: () {},
                    image: 'assets/images/question.png',
                    size: size,
                    text: 'Contact Customer Service',
                    istrue: false),
                ProfieTile(
                    function: () {},
                    image: 'assets/images/privacy-policy.png',
                    size: size,
                    text: 'Privacy and Policy',
                    istrue: false),
                ProfieTile(
                    function: () {},
                    image: 'assets/images/terms-and-conditions (1).png',
                    size: size,
                    text: 'Terms and Conditions',
                    istrue: false),
                ProfieTile(
                    function: () {},
                    image: 'assets/images/info.png',
                    size: size,
                    text: 'About',
                    istrue: false),
                ProfieTile(
                    function: () {},
                    image: 'assets/images/log-out.png',
                    size: size,
                    text: 'Logout',
                    istrue: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
