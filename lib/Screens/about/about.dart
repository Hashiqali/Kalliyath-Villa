import 'package:flutter/material.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.black,
        centerTitle: true,
        title: Text('About',
            style: apptextstyle(
                color: AppColors.white, family: 'Kalliyath', size: 20)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 20, top: 20, left: 10, right: 10),
          child: Text('''About the KALLIYATH VILLA

The Villa Booking Application kALLIYATH VILLA is a platform operated by SLASHI that facilitates the booking of villas for short-term accommodation. Through the App, users can browse available villas, view photos and descriptions, check availability, make bookings, and manage their reservations.

The App provides a convenient and user-friendly interface for users to search for villas based on their preferences, including location, amenities, and price. Users can also communicate with villa owners or managers, ask questions, and receive assistance with their bookings.

While we strive to provide accurate and up-to-date information, we cannot guarantee the availability or accuracy of all listings on the App. Villa availability, pricing, and other details are provided by the respective villa owners or managers and may be subject to change without notice.

The App may also include features such as payment processing, reviews and ratings, and customer support to enhance the user experience and ensure a seamless booking process.

By using the App, you acknowledge and agree that:

The App is provided on an "as is" and "as available" basis, and we make no representations or warranties of any kind, express or implied, regarding the App or its content.
We do not endorse, control, or assume responsibility for the accuracy, completeness, or legality of any listings, user-generated content, or communications made through the App.
Your use of the App is at your own risk, and we shall not be liable for any damages or losses arising out of or in connection with your use of the App.
If you have any questions or concerns about the App, please contact us at hashiqali3080@gmail.com.''',
              style: apptextstyle(color: AppColors.white, size: 15)),
        ),
      ),
    );
  }
}
