import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:dalil_syria/features/booking/presentation/widgets/booking_section_title.dart';
import 'package:dalil_syria/features/booking/presentation/widgets/counter_button.dart';
import 'package:flutter/material.dart';

class BookingOptions extends StatelessWidget {
  const BookingOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookingSectionTitle(title: "Select Date"),

        const AppCard(
          child: TextField(
            decoration: InputDecoration(
              hintText: "yyyy / شهر / يوم",
              suffixIcon: Icon(Icons.calendar_month_outlined, size: 20),
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
        BookingSectionTitle(title: "Number of Guests"),
        AppCard(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CounterButton(icon: Icons.remove),
              const Text(
                "2",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CounterButton(icon: Icons.add),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "Maximum 15 guests per trip",
            style: TextStyle(color: Colors.grey, fontSize: 11),
          ),
        ),
      ],
    );
  }
}
