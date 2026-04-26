import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/trip_timeline_item.dart';
import 'package:flutter/material.dart';

class TripTimelineSection extends StatelessWidget {
  const TripTimelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: "Trip Timeline",
      child: Column(
        children: const [
          TripTimelineItem(
            day: "Day 1",
            title: "Arrival & Temple of Bel",
            desc: "Welcome to Palmyra...",
            isFirst: true,
          ),
          TripTimelineItem(
            day: "Day 2",
            title: "Valley of the Tombs",
            desc: "Visit the tombs...",
          ),
          TripTimelineItem(
            day: "Day 3",
            title: "Museum",
            desc: "Explore artifacts",
            isLast: true,
          ),
        ],
      ),
    );
  }
}
