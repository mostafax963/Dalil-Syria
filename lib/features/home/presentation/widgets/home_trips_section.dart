import 'package:dalil_syria/core/shered/widgets/async_value_widget.dart';
import 'package:dalil_syria/features/home/presentation/providers/home_provider.dart';
import 'package:dalil_syria/features/home/presentation/providers/home_search_provider.dart';
import 'package:dalil_syria/features/home/presentation/widgets/recommended_trip_tile.dart';
import 'package:dalil_syria/features/trips/presentation/views/trip_details_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTripsSection extends ConsumerWidget {
  const HomeTripsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsAsync = ref.watch(tripsProvider);
    final search = ref.watch(homeSearchProvider);

    return AsyncValueWidget(
      value: tripsAsync,

      onRetry: () => ref.invalidate(tripsProvider),

      data: (trips) {
        final filteredTrips = trips.where((trip) {
          final title = trip.title.toLowerCase();
          final location = trip.location.toLowerCase();
          final price = trip.price.toString();

          return title.contains(search) ||
              location.contains(search) ||
              price.contains(search);
        }).toList();

        if (filteredTrips.isEmpty) {
          return Center(child: Text("home_no_trips".tr()));
        }

        return Column(
          children: filteredTrips.asMap().entries.map((entry) {
            final index = entry.key;
            final trip = entry.value;

            return RecommendedTripTile(
              imageUrl: trip.image,
              title: trip.title,
              location: trip.location,
              price: "\$${trip.price}",
              duration_days: trip.durationDays,
              duration_nights: trip.durationNights,
              index: index,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TripDetailsView(tripId: trip.id),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
