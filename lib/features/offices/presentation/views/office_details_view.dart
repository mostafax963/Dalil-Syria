import 'package:dalil_syria/core/shered/widgets/async_value_widget.dart';
import 'package:dalil_syria/core/shered/widgets/network_aware_widget.dart';
import 'package:dalil_syria/features/offices/presentation/provider/office_provider.dart';
import 'package:dalil_syria/features/offices/presentation/widgets/office_header.dart';
import 'package:dalil_syria/features/offices/presentation/widgets/office_info_section.dart';
import 'package:dalil_syria/features/offices/presentation/widgets/office_trips_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OfficeDetailsView extends ConsumerWidget {
  final String officeId;

  const OfficeDetailsView({super.key, required this.officeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(officeDetailsProvider(officeId));

    return NetworkAwareWidget(
      onRetry: () {
        ref.invalidate(officeDetailsProvider(officeId));
      },
      child: Scaffold(
        body: AsyncValueWidget(
          value: asyncData,
          onRetry: () {
            ref.invalidate(officeDetailsProvider(officeId));
          },

          data: (data) {
            final office = data.office;
            final trips = data.trips;

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
                        OfficeInfoSection(office: office),

                        const SizedBox(height: 20),

                        OfficeTripsSection(trips: trips),
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
