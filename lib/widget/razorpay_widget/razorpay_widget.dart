import 'dart:developer';
import 'package:kalliyath_villa/Screens/booking_page/booking/Booking_details/book_now.dart';

opencheckout({
  required int amount,
  required String villaname,
}) {
  var options = {
    'key': 'rzp_test_1G58uNplUf0IqG',
    'amount': amount,
    'name': villaname,
    'description': 'Villa Payment',
    'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
    'external': {
      'wallets': ['paytm', 'phonepe', 'gpay']
    }
  };

  try {
    razorpay.open(options);
  } catch (e) {
    log(e.toString());
  }
}
