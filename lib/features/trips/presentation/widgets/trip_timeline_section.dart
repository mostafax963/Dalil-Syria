import 'package:dalil_syria/core/shered/widgets/app_card.dart';

import 'package:dalil_syria/features/trips/domain/entities/trip_timeline_entity.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/trip_timeline_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TripTimelineSection extends StatelessWidget {
  final List<TripTimelineEntity> timeline;

  const TripTimelineSection({super.key, required this.timeline});

  @override
  Widget build(BuildContext context) {
    if (timeline.isEmpty) {
      return Text("trip_no_timeline".tr());
    }

    return AppCard(
      title: "trip_timeline".tr(),
      child: Column(
        children: timeline.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;

          return TripTimelineItem(
            day: "${"day".tr()} ${item.day}",
            title: item.title,
            desc: item.description,
            isFirst: index == 0,
            isLast: index == timeline.length - 1,
          );
        }).toList(),
      ),
    );
  }
}
