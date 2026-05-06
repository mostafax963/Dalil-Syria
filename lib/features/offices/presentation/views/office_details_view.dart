import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:dalil_syria/features/offices/presentation/PROVIDER/office_provider.dart';
import 'package:dalil_syria/features/offices/presentation/widgets/available_trip_card.dart';
import 'package:dalil_syria/features/offices/presentation/widgets/office_contact_row.dart';
import 'package:dalil_syria/features/offices/presentation/widgets/office_header.dart';
import 'package:dalil_syria/features/trips/presentation/views/trip_details_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OfficeDetailsView extends ConsumerWidget {
  final String officeId;

  const OfficeDetailsView({super.key, required this.officeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(officeDetailsProvider(officeId));

    return Scaffold(
      body: asyncData.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (e, _) {
          return Center(child: Text("Error: $e"));
        },

        data: (data) {
          final office = data["office"];
          final trips = data["trips"];

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OfficeHeader(imageUrl: office.image),

                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${office.reviewsCount} ${"office_reviews".tr()}"),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 16),
                          const SizedBox(width: 5),
                          Text(office.location),
                        ],
                      ),

                      const SizedBox(height: 20),

                      AppCard(
                        title: "office_about".tr(),
                        child: Text(office.about),
                      ),

                      const SizedBox(height: 20),

                      AppCard(
                        title: "office_contact".tr(),
                        child: Column(
                          children: [
                            OfficeContactRow(
                              icon: Icons.phone,
                              text: office.phone,
                            ),
                            const Divider(),
                            OfficeContactRow(
                              icon: Icons.email,
                              text: office.email,
                            ),
                            const Divider(),
                            OfficeContactRow(
                              icon: Icons.language,
                              text: office.website ?? "",
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        "Available Trips".tr(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      if (trips.isEmpty)
                        Center(child: Text("office_no_trips".tr()))
                      else
                        Column(
                          children: trips.map<Widget>((trip) {
                            return AvailableTripCard(
                              title: trip.title,
                              imageUrl: trip.image,
                              duration:
                                  "${trip.durationDays} ${"Days".tr()} / ${trip.durationNights} ${"Nights".tr()}"
                                      .toString(),
                              price: "\$${trip.price}",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TripDetailsView(tripId: trip.id),
                                  ),
                                );
                              },
                            );
                          }).toList(),
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
