import 'package:dalil_syria/core/shered/widgets/app_card.dart';

import 'package:dalil_syria/features/trips/domain/entities/trip_included_entity.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/trip_included_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TripIncludedSection extends StatelessWidget {
  final List<TripIncludedEntity> included;

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
