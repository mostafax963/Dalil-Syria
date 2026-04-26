import 'package:dalil_syria/core/shered/widgets/heder.dart';
import 'package:flutter/material.dart';
import '../widgets/my_booking_card.dart';

class MyBookingsView extends StatelessWidget {
  const MyBookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: Column(
        children: [
          Heder(
            section_name: "My Bookings",
            second_name: "Check your upcoming and past trips",
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: const [
                MyBookingCard(
                  title: "Ancient Palmyra Expedition",
                  date: "15 May 2026",
                  imagePath: "images/imag 1.jpg",
                  status: "Upcoming",
                ),
                MyBookingCard(
                  title: "Damascus Heritage Tour",
                  date: "22 June 2026",
                  imagePath: "images/imag 1.jpg",
                  status: "Pending",
                ),
                MyBookingCard(
                  title: "Lattakia Beach Trip",
                  date: "10 April 2026",
                  imagePath: "images/imag 1.jpg",
                  status: "Completed",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
