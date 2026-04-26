import 'package:dalil_syria/features/attractions/presentation/widgets/about_section.dart';
import 'package:dalil_syria/features/attractions/presentation/widgets/attraction_image_header.dart';
import 'package:dalil_syria/features/attractions/presentation/widgets/available_tours_section.dart';
import 'package:dalil_syria/features/attractions/presentation/widgets/highlights_section.dart';
import 'package:dalil_syria/features/attractions/presentation/widgets/info_quick_grid.dart';
import 'package:dalil_syria/features/trips/presentation/views/trip_details_view.dart';
import 'package:flutter/material.dart';

class AttractionDetailsView extends StatelessWidget {
  const AttractionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AttractionImageHeader(),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InfoQuickGrid(),
                  const SizedBox(height: 25),

                  const AboutSection(),
                  const SizedBox(height: 25),

                  const HighlightsSection(),

                  const SizedBox(height: 30),
                  AvailableToursSection(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripDetailsView(),
                        ),
                      );
                    },
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
