import 'package:dalil_syria/core/theme/app_colors.dart';
import 'package:dalil_syria/features/trips/data/models/trip_details_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TripInfoBadges extends StatelessWidget {
  final TripDetailsModel trip;
  const TripInfoBadges({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          _buildBadge(
            Icons.access_time,
            "${trip.duration_days} ${"Days".tr()} / ${trip.duration_nights} ${"Nights".tr()}",
            context,
          ),
          const SizedBox(width: 15),
          _buildBadge(
            Icons.group_outlined,
            "${"trip_max_people".tr()} ${trip.maxPeople} ",
            context,
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(IconData icon, String text, context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.card(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF0D6EFD)),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: AppColors.textPrimary(context),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
