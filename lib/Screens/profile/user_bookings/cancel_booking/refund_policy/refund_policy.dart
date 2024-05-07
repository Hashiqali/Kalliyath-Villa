import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/profile/user_bookings/cancel_booking/bloc/cancel_bloc.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

refundpolicy({required Size size, required blocprivacy}) {
  return BlocBuilder<CancelBloc, CancelState>(
    bloc: blocprivacy,
    builder: (context, state) {
      bool privacy = false;
      if (state is PolicybuilderState) {
        privacy = state.istrue;
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              blocprivacy.add(Policybuilder(istrue: privacy));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.white)),
                height: size.height / 20,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Refund Policy',
                        style: apptextstyle(
                            color: AppColors.white,
                            size: 15,
                            weight: FontWeight.normal),
                      ),
                      Icon(
                        privacy ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                        color: AppColors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          privacy
              ? Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Text(
                    '''Refund Policy At Kalliyath villa, we strive to provide a seamless booking experience for our customers. We understand that plans can change, and sometimes cancellations are necessary. Below, you'll find our refund policy outlining the terms and conditions for cancellations and refunds.
                        
1. Cancellation Policy:
                        
                        Customers can cancel their villa bookings at any time, but refunds will be subject to the terms outlined below.
                
                To initiate a cancellation, customers must contact our support team or cancel the booking through their account on app.
            
2. Refund Eligibility:
                        
                        Refunds will only be issued for cancellations made within 24 hours of the initial booking.
                        Cancellations made after 24 hours of booking will not be eligible for a refund. 
            
3. Refund Process:
                        
                        If a cancellation is eligible for a refund according to the above criteria, we will initiate the refund process within 24 hours.
                  Refunds will be issued to the original payment method used for the booking (e.g., credit/debit card, Razorpay).
            
4. Refund Timeline:
                        
                        Once initiated, the refund process may take up to 4 business days to reflect in the customer's account, depending on the payment method and banking institution.
            
5. Non-Refundable Situations:
                        
                    In certain circumstances, refunds may not be granted, including but not limited to:
                      Cancellations made after 24 hours of booking.Failure to meet the terms and conditions of the booking agreement.No-shows or early departures.
            
6. Contact Us:
                        
                        If you have any questions or concerns regarding our refund policy or a specific booking, please don't hesitate to contact our customer support team. We're here to assist you.
            
7. Policy Updates:
                        
                        Kalliyath villa reserves the right to update or modify this refund policy at any time without prior notice. Any changes will be effective immediately upon posting on our app.''',
                    style: apptextstyle(color: AppColors.white, size: 12),
                  ),
                )
              : const SizedBox()
        ],
      );
    },
  );
}
