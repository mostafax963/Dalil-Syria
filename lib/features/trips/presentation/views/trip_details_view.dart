import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:dalil_syria/core/shered/widgets/custom_button.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/image_slider.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/trip_about_section.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/trip_header.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/trip_included_section.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/trip_info_badges.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/trip_timeline_section.dart';
import 'package:flutter/material.dart';

class TripDetailsView extends StatelessWidget {
  const TripDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImageSlider(),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TripHeader(),
                  const SizedBox(height: 24),

                  const AppCard(child: TripInfoBadges()),
                  const SizedBox(height: 24),

                  const TripAboutSection(),
                  const SizedBox(height: 24),

                  const TripTimelineSection(),
                  const SizedBox(height: 24),

                  const TripIncludedSection(),
                  const SizedBox(height: 120),
                  CustomButton(text: "Book Now", onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
