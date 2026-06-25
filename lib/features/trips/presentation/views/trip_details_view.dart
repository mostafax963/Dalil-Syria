import 'package:dalil_syria/features/trips/presentation/provider/trip_provider.dart';

import 'package:dalil_syria/features/trips/presentation/widgets/trip_details_body.dart';

import 'package:dalil_syria/core/shered/widgets/network_aware_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TripDetailsView extends ConsumerWidget {
  final String tripId;

  const TripDetailsView({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NetworkAwareWidget(
      onRetry: () {
        ref.invalidate(tripDetailsProvider(tripId));
      },
      child: Scaffold(body: TripDetailsBody(tripId: tripId)),
    );
  }
}
