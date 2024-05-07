import 'package:flutter/material.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.black,
        centerTitle: true,
        title: Text('Privacy and Policy',
            style: apptextstyle(
                color: AppColors.white, family: 'Kalliyath', size: 20)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 20, top: 20, left: 10, right: 10),
          child: Text('''Privacy Policy of KALLIYATH VILLA
              
              This Privacy Policy describes how your personal information is collected, used, and shared when you use the Villa Booking Application Kalliyath villa.
    
Personal Information We Collect
              
 When you use the App, we collect certain information about you, including Information about your device, including the device's unique identifier, operating system, and mobile network information.Log information, including details of how you use the App, such as the duration of your session and the actions you take.Information you provide us when you register an account, such as your name, email address, and payment information.

How We Use Your Personal Information
              
             We use the personal information we collect to Provide and improve the App's functionality and user experience.Communicate with you, including sending booking confirmations, updates, and promotional offers.Personalize your experience within the App.Detect, prevent, and address technical issues and fraudulent activity.Sharing Your Personal Information
              
              We may share your personal information with third parties to help us operate the App and deliver services to you. For example:  
              With service providers who assist us in processing payments, sending emails, and providing customer support.With law enforcement or regulatory authorities if we believe disclosure is necessary to comply with applicable laws or regulations, or to protect the rights, property, or safety of our users or others.Data Retention We retain your personal information for as long as necessary to fulfill the purposes outlined in this Privacy Policy unless a longer retention period is required or permitted by law.
              
Your Rights
              
           You have the right to access and update your personal information, as well as to request that we delete it. You can do this by contacting us using the information provided at the end of this Privacy Policy.
              
Changes to This Privacy Policy
              
                      We may update this Privacy Policy from time to time to reflect changes in our practices or for other operational, legal, or regulatory reasons. We encourage you to review this Privacy Policy periodically for any changes.
              
Contact Us
              
              If you have any questions or concerns about our Privacy Policy or our practices regarding your personal information,you may contact us at hashiqali3080@gmail.com.''',
              style: apptextstyle(color: AppColors.white, size: 15)),
        ),
      ),
    );
  }
}
