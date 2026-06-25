import 'package:dalil_syria/features/offices/domain/entities/office_trip_entity.dart';

import 'package:dalil_syria/features/offices/presentation/widgets/available_trip_card.dart';
import 'package:dalil_syria/features/trips/presentation/views/trip_details_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OfficeTripsSection extends StatelessWidget {
  final List<OfficeTripEntity> trips;

  const OfficeTripsSection({super.key, required this.trips});

  @override
  Widget build(BuildContext context) {
    if (trips.isEmpty) {
      return Center(child: Text("office_no_trips".tr()));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Available Trips".tr(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),

        Column(
          children: trips.map((trip) {
            return AvailableTripCard(
              title: trip.title,
              imageUrl: trip.image,
              duration:
                  "${trip.durationDays} ${"Days".tr()} / ${trip.durationNights} ${"Nights".tr()}",
              price: "\$${trip.price}",
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
        ),
      ],
    );
  }
}
