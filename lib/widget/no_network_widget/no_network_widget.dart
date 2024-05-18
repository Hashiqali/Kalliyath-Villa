import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

class NoNetworkWidget extends StatelessWidget {
  NoNetworkWidget({super.key});
  final SplashLoginBloc blocnetwork = SplashLoginBloc();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'No network connection !!',
              style: apptextstyle(
                  color: Colors.white,
                  size: 15,
                  family: 'Kalliyath3',
                  weight: FontWeight.normal),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image(
                width: size.width / 5,
                color: const Color.fromARGB(132, 255, 255, 255),
                image: const AssetImage('assets/images/no-internet.png'),
              ),
            ),
            BlocBuilder<SplashLoginBloc, SplashLoginState>(
              bloc: blocnetwork,
              builder: (context, state) {
                bool loading = false;

                if (state is LoadingState) {
                  loading = true;
                } else if (state is SuccessState) {
                  loading = false;
                }
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Material(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: const Color.fromARGB(121, 129, 128, 128),
                      onTap: () async {
                        if (!loading) {
                          blocnetwork.add(LodingEvent(istrue: false));
                          var connectivityResult =
                              await Connectivity().checkConnectivity();
                          if (connectivityResult != ConnectivityResult.none) {
                            await Future.delayed(const Duration(seconds: 1));
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => const SplashScreen()));
                          }
                        }
                      },
                      child: Container(
                        height: size.height / 20,
                        width: size.width / 3,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(42, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: loading
                            ? Center(
                                child: SizedBox(
                                height: size.height / 30,
                                width: size.width / 14,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ))
                            : Center(
                                child: Text(
                                  'Try Again',
                                  style: apptextstyle(
                                      color: Colors.white,
                                      size: 15,
                                      family: 'Kalliyath3',
                                      weight: FontWeight.normal),
                                ),
                              ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
