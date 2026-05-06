import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TripAboutSection extends StatelessWidget {
  final String description;
  const TripAboutSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return AppCard(title: "trip_about".tr(), child: Text(description));
  }
}
