// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dalil_syria/features/trips/domain/entities/trip_details_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:dalil_syria/features/booking/presentation/widgets/summary_row.dart';

class TripSummaryCard extends StatelessWidget {
  final TripDetailsEntity trip;
  const TripSummaryCard({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trip Summary".tr(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          SummaryRow(label: trip.title, value: "\$${trip.price}"),
          const Divider(height: 25),
          SummaryRow(label: "Duration".tr(), value: "${trip.durationDays}"),
        ],
      ),
    );
  }
}
