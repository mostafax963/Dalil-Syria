import 'package:dalil_syria/core/theme/app_colors.dart';
import 'package:dalil_syria/features/trips/domain/entities/trip_details_entity.dart';
import 'package:flutter/material.dart';

class TripHeader extends StatelessWidget {
  final TripDetailsEntity trip;
  const TripHeader({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                trip.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
            Text(
              '\$${trip.price}',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 16,
              color: AppColors.textSecondary(context),
            ),
            const SizedBox(width: 4),
            Text(
              trip.location,
              style: TextStyle(color: AppColors.textSecondary(context)),
            ),
          ],
        ),
      ],
    );
  }
}
