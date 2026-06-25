import 'package:dalil_syria/core/shered/widgets/heder.dart';
import 'package:dalil_syria/features/booking/presentation/Provider/booking_provider.dart';
import 'package:dalil_syria/features/booking/presentation/widgets/my_booking_card.dart';
import 'package:dalil_syria/features/trips/presentation/views/trip_details_view.dart';
import 'package:dalil_syria/core/shered/widgets/network_aware_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyBookingsView extends ConsumerWidget {
  const MyBookingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(bookingsProvider);

    return NetworkAwareWidget(
      onRetry: () {
        ref.invalidate(bookingsProvider);
      },
      child: Scaffold(
        body: Column(
          children: [
            Heder(
              section_name: "my_bookings_title".tr(),
              second_name: "my_bookings_subtitle".tr(),
              icon_name: Icons.book_online_outlined,
            ),

            Expanded(
              child: asyncData.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (e, _) => Center(child: Text(e.toString())),

                data: (list) {
                  if (list.isEmpty) {
                    return Center(child: Text("my_bookings_empty".tr()));
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final booking = list[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  TripDetailsView(tripId: booking.tripId),
                            ),
                          );
                        },
                        child: MyBookingCard(
                          title: booking.title,
                          date: booking.date,
                          imagePath: booking.image,
                          status: booking.status,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
