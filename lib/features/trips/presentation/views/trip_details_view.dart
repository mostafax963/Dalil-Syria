import 'package:dalil_syria/core/shered/widgets/custom_button.dart';
import 'package:dalil_syria/features/booking/presentation/views/booking_view.dart';
import 'package:dalil_syria/features/trips/presentation/provider/trip_provider.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/image_slider.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/trip_about_section.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/trip_header.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/trip_included_section.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/trip_info_badges.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/trip_timeline_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TripDetailsView extends ConsumerWidget {
  final String tripId;

  const TripDetailsView({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTrip = ref.watch(tripDetailsProvider(tripId));

    return Scaffold(
      body: asyncTrip.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (e, _) {
          print(e);
          return Center(child: Text("Error: $e"));
        },

        data: (trip) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ImageSlider(images: trip.images, tripId: trip.id),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TripHeader(trip: trip),

                      const SizedBox(height: 20),

                      TripInfoBadges(trip: trip),

                      const SizedBox(height: 20),

                      TripAboutSection(description: trip.description),

                      const SizedBox(height: 20),

                      TripTimelineSection(timeline: trip.timeline),

                      const SizedBox(height: 20),

                      TripIncludedSection(included: trip.included),

                      SizedBox(height: 20),
                      CustomButton(
                        text: "trip_book_now".tr(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingView(trip: trip),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
