import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:dalil_syria/features/booking/presentation/widgets/summary_row.dart';
import 'package:flutter/material.dart';

class TripSummaryCard extends StatelessWidget {
  const TripSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Trip Summary",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          SummaryRow(label: "Ancient Palmyra Expedition", value: "\$120"),
          const Divider(height: 25),
          SummaryRow(label: "Duration", value: "3 Days"),
        ],
      ),
    );
  }
}
