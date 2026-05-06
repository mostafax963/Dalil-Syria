import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:dalil_syria/features/trips/data/models/trip_included_model.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/trip_included_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TripIncludedSection extends StatelessWidget {
  final List<TripIncludedModel> included;

  const TripIncludedSection({super.key, required this.included});

  @override
  Widget build(BuildContext context) {
    if (included.isEmpty) {
      return Text("trip_no_included".tr());
    }

    return AppCard(
      title: "trip_whats_included".tr(),
      child: Column(
        children: included.map((item) {
          return TripIncludedItem(text: item.title);
        }).toList(),
      ),
    );
  }
}
