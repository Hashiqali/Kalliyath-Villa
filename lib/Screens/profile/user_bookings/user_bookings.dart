import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/user_booking_tab_bar/user_booking_tabbar.dart';

import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

class UserBookingsPage extends StatefulWidget {
  const UserBookingsPage({super.key});

  @override
  State<UserBookingsPage> createState() => _UserBookingsPage();
}


class _UserBookingsPage extends State<UserBookingsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
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
          title: Text('Bookings',
              style: apptextstyle(
                  color: AppColors.white, family: 'Kalliyath', size: 20)),
          bottom: TabBar(
            tabAlignment: TabAlignment.fill,
            dividerColor: AppColors.black,
            indicatorColor: AppColors.white,
            labelStyle: apptextstyle(color: AppColors.white, size: 15),
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'Active',
              ),
              Tab(text: 'Past'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
        body: userTabBar(tabController: _tabController, size: size));
  }
}
