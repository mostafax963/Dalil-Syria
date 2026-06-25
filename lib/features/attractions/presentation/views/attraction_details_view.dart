import 'package:dalil_syria/core/shered/widgets/async_value_widget.dart';
import 'package:dalil_syria/core/shered/widgets/network_aware_widget.dart';
import 'package:dalil_syria/features/attractions/presentation/PROVIDERS/attraction_provider.dart';
import 'package:dalil_syria/features/attractions/presentation/widgets/about_section.dart';
import 'package:dalil_syria/features/attractions/presentation/widgets/attraction_image_header.dart';
import 'package:dalil_syria/features/attractions/presentation/widgets/available_tours_section.dart';
import 'package:dalil_syria/features/attractions/presentation/widgets/highlights_section.dart';
import 'package:dalil_syria/features/attractions/presentation/widgets/info_quick_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttractionDetailsView extends ConsumerWidget {
  final String id;

  const AttractionDetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(attractionDetailsProvider(id));

    return NetworkAwareWidget(
      onRetry: () {
        ref.invalidate(attractionDetailsProvider(id));
      },
      child: Scaffold(
        body: AsyncValueWidget(
          value: asyncData,
          onRetry: () {
            ref.invalidate(attractionDetailsProvider(id));
          },

          data: (data) {
            final attraction = data.attraction;
            final highlights = data.highlights;
            final trips = data.trips;

            return SingleChildScrollView(
              child: Column(
                children: [
                  AttractionImageHeader(
                    image: attraction.image,
                    title: attraction.title,
                    location: attraction.location,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        InfoQuickGrid(
                          duration: attraction.visitDuration,
                          bestTime: attraction.bestTime,
                        ),
                        SizedBox(height: 10),

                        AboutSection(description: attraction.description),
                        SizedBox(height: 10),

                        HighlightsSection(highlights: highlights),

                        const SizedBox(height: 20),

                        AvailableToursSection(trips: trips),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
