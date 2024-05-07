import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/Booking_details/user_details_box/price_tile/price_tile.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:kalliyath_villa/widget/guest_visibility_widget/guest_visibility.dart';

class UserBookingDetails extends StatelessWidget {
  const UserBookingDetails({super.key, required this.bookings});
  final dynamic bookings;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.black,
        centerTitle: true,
        title: Text('Booking Details',
            style: apptextstyle(
                color: AppColors.white, family: 'Kalliyath', size: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        image: NetworkImage(bookings['villa']['image'])),
                    borderRadius: BorderRadius.circular(15)),
                height: size.height / 3.5,
                width: size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookings['villa']['name'],
                    style: apptextstyle(color: AppColors.white, size: 25),
                  ),
                  Text(
                    bookings['villa']['place'],
                    style: apptextstyle(color: AppColors.white, size: 12),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Check-in (11:00 AM)',
                          style: apptextstyle(
                              color: const Color.fromARGB(225, 34, 251, 41),
                              size: 16),
                        ),
                        Text(
                          DateFormat.yMMMMd().format(DateTime.parse(
                              bookings['villa']['checkin'].toString())),
                          style: apptextstyle(color: AppColors.white, size: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Check-out (10:00 AM)',
                    style: apptextstyle(color: AppColors.red, size: 16),
                  ),
                  Text(
                    DateFormat.yMMMMd().format(DateTime.parse(
                        bookings['villa']['checkout'].toString())),
                    style: apptextstyle(color: AppColors.white, size: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4, top: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    'Booking id : ${bookings.id}',
                    style: apptextstyle(color: AppColors.black, size: 16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 4,
                top: 10,
              ),
              child: SizedBox(
                height: size.height / 18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Guests',
                      style: apptextstyle(color: AppColors.white, size: 16),
                    ),
                    Row(
                      children: [
                        guestVisibility(
                            visibility: true,
                            text: 'Adults : ${bookings['villa']['adults']}',
                            appsize: 13),
                        guestVisibility(
                            visibility: bookings['villa']['childrens'] != 0,
                            appsize: 13,
                            text:
                                ' , Childrens : ${bookings['villa']['childrens']}'),
                        guestVisibility(
                            visibility: bookings['villa']['infants'] != 0,
                            appsize: 13,
                            text:
                                ' , Infants : ${bookings['villa']['infants']}3'),
                        guestVisibility(
                            visibility: bookings['villa']['extraperson'] != 0,
                            appsize: 13,
                            text:
                                ' , Extraperson : ${bookings['villa']['extraperson']}3')
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4, top: 10),
              child: Container(
                height: size.height / 6,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.white,
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 5, right: 10, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Paid Amount',
                        style: apptextstyle(color: AppColors.white, size: 16),
                      ),
                      priceTile(
                          heading: 'Villa price',
                          value: '₹ ${int.parse(bookings['price']['price'])}'),
                      priceTile(
                          heading: 'Extrapersons',
                          value: '₹ ${bookings['price']['extraperson']}'),
                      priceTile(
                          heading: 'Per night ',
                          value: '₹ ${bookings['price']['pernight']}'),
                      priceTile(
                          heading: 'Taxes',
                          value: '₹ ${bookings['price']['taxes']}'),
                      priceTile(
                          heading: 'Total amount',
                          value: '₹ ${bookings['price']['total']}',
                          size: 14,
                          weight: FontWeight.w600)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
