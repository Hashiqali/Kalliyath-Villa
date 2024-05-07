import 'package:flutter/material.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.black,
        centerTitle: true,
        title: Text('Terms and Conditions',
            style: apptextstyle(
                color: AppColors.white, family: 'Kalliyath', size: 20)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 20, top: 20, left: 10, right: 10),
          child: Text('''Terms and Conditions of KALLIYATH VILLA

These terms and conditions govern your use of the Villa Booking Application Kalliyath villa, operated by SLASHI. By accessing or using the App, you agree to be bound by these Terms. If you do not agree to these Terms, please do not use the App.

1. Use of the App

1.1 You must be at least 18 years old to use the App. By using the App, you represent and warrant that you are at least 18 years old.

1.2 You agree to use the App only for lawful purposes and in accordance with these Terms and all applicable laws and regulations.

2. User Accounts

2.1 In order to access certain features of the App, you may be required to create an account. You agree to provide accurate, current, and complete information when creating your account and to update your information promptly if it changes.

2.2 You are responsible for maintaining the confidentiality of your account credentials and for any activity that occurs under your account. You agree to notify us immediately of any unauthorized access to or use of your account.

3. Booking and Payment

3.1 When booking a villa through the App, you agree to provide accurate and complete information, including your name, contact information, and payment details.

3.2 All bookings made through the App are subject to availability and confirmation by the villa owner or manager. We reserve the right to cancel or refuse any booking at our discretion.

3.3 Payment for bookings must be made in accordance with the payment terms specified in the App. Failure to make payment may result in the cancellation of your booking.

4. Cancellation and Refunds

4.1 Cancellation and refund policies vary depending on the specific villa and the terms set by the villa owner or manager. You agree to familiarize yourself with the applicable cancellation and refund policies before making a booking.

4.2 We are not responsible for any disputes or disagreements between you and the villa owner or manager regarding cancellations or refunds.

5. Intellectual Property

5.1 The App and its content, including text, graphics, logos, images, and software, are the property of SLASHI or its licensors and are protected by copyright and other intellectual property laws.

5.2 You may not modify, reproduce, distribute, or create derivative works of the App or its content without our prior written consent.

6. Limitation of Liability

6.1 To the fullest extent permitted by law, we shall not be liable for any direct, indirect, incidental, special, consequential, or punitive damages arising out of or in connection with your use of the App.

7. Changes to These Terms

7.1 We reserve the right to update or modify these Terms at any time without prior notice. Any changes will be effective immediately upon posting on the App. Your continued use of the App following the posting of changes constitutes your acceptance of such changes.

8. Governing Law

8.1 These Terms shall be governed by and construed in accordance with the laws of ours, without regard to its conflict of law provisions.

9. Contact Us

9.1 If you have any questions or concerns about these Terms or the App, you may contact us at hashiqali3080@gmail.com.''',
              style: apptextstyle(color: AppColors.white, size: 15)),
        ),
      ),
    );
  }
}
