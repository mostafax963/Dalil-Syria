import 'package:dalil_syria/core/shered/widgets/custom_button.dart';
import 'package:dalil_syria/core/shered/widgets/heder.dart';
import 'package:dalil_syria/features/booking/presentation/widgets/booking_options.dart';
import 'package:dalil_syria/features/booking/presentation/widgets/contact_info_form.dart';
import 'package:dalil_syria/features/booking/presentation/widgets/price_breakdown.dart';
import 'package:dalil_syria/features/booking/presentation/widgets/trip_summary_card.dart';
import 'package:flutter/material.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Heder(
            section_name: "Book Your Trip",
            second_name: "Complete your booking details",
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const TripSummaryCard(),
                  const SizedBox(height: 25),
                  const BookingOptions(),
                  const SizedBox(height: 25),
                  const ContactInfoForm(),

                  const SizedBox(height: 20),
                  PriceBreakdown(),

                  const SizedBox(height: 30),

                  CustomButton(text: "Confirm Booking", onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
