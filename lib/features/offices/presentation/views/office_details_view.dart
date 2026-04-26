import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:dalil_syria/features/offices/presentation/widgets/office_contact_row.dart';
import 'package:dalil_syria/features/offices/presentation/widgets/office_header.dart';

import 'package:flutter/material.dart';
import '../widgets/available_trip_card.dart';

class OfficeDetailsView extends StatelessWidget {
  const OfficeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color scaffoldBgColor = Color(0xFFFBFBFC);

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OfficeHeader(),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  const Text(
                    "245 reviews",
                    style: TextStyle(color: Color(0xFF7D848D), fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Color(0xFF7D848D),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Old Damascus, Syria",
                        style: TextStyle(color: Color(0xFF7D848D)),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  AppCard(
                    title: "About",
                    child: Text(
                      "Experience the timeless beauty of Damascus with expert guides who bring history to life. We specialize in cultural tours, historical sites, and authentic local experiences.",
                      style: TextStyle(
                        color: Color(0xFF7D848D),
                        height: 1.6,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  AppCard(
                    title: "Contact Information",
                    child: Column(
                      children: [
                        OfficeContactRow(
                          icon: Icons.phone_outlined,
                          text: "+963 11 xxx xxxx",
                        ),
                        const Divider(height: 24, color: Color(0xFFF1F1F1)),
                        OfficeContactRow(
                          icon: Icons.email_outlined,
                          text: "info@damascusheritage.sy",
                        ),
                        const Divider(height: 24, color: Color(0xFFF1F1F1)),
                        OfficeContactRow(
                          icon: Icons.language_outlined,
                          text: "damascusheritage.sy",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "Available Trips",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),

                  AvailableTripCard(
                    title: "Umayyad Mosque Tour",
                    duration: "2 hours",
                    price: "\$30",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
