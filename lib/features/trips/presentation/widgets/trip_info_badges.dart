import 'package:dalil_syria/core/theme/app_colors.dart';
import 'package:dalil_syria/features/trips/domain/entities/trip_details_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TripInfoBadges extends StatelessWidget {
  final TripDetailsEntity trip;
  const TripInfoBadges({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _TripBadge(
            icon: Icons.access_time,
            text:
                '${trip.durationDays} ${'Days'.tr()} / ${trip.durationNights} ${'Nights'.tr()}',
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: _TripBadge(
            icon: Icons.group_outlined,
            text: '${'trip_max_people'.tr()} ${trip.maxPeople}',
          ),
        ),
      ],
    );
  }
}

class _TripBadge extends StatelessWidget {
  final IconData icon;
  final String text;
  const _TripBadge({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.card(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.primary),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.textPrimary(context),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
