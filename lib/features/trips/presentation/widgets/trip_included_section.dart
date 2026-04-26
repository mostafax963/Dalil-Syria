import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/trip_included_item.dart';
import 'package:flutter/material.dart';

class TripIncludedSection extends StatelessWidget {
  const TripIncludedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: "What's Included",
      child: Column(
        children: const [
          TripIncludedItem(text: "Professional guide"),
          TripIncludedItem(text: "Accommodation"),
          TripIncludedItem(text: "Meals"),
        ],
      ),
    );
  }
}
