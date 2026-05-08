import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalil_syria/features/trips/presentation/views/trip_details_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AvailableToursSection extends StatelessWidget {
  final List trips;

  const AvailableToursSection({super.key, required this.trips});

  @override
  Widget build(BuildContext context) {
    if (trips.isEmpty) {
      return Text("attractions_no_trips".tr());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Available Tours".tr(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 15),

        Column(
          children: trips.map((trip) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TripDetailsView(tripId: trip.id),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      width: 80,
                      height: 80,
                      imageUrl: trip.image,
                      fit: BoxFit.cover,

                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),

                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(trip.title),
                          Text("${trip.duration_days} ${"Days".tr()}"),
                          Text("\$${trip.price}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
