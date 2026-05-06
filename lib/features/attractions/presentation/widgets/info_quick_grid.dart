import 'package:dalil_syria/core/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InfoQuickGrid extends StatelessWidget {
  final String duration;
  final String bestTime;
  const InfoQuickGrid({
    super.key,
    required this.duration,
    required this.bestTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildInfoBox(
          Icons.access_time,
          "Visit Duration".tr(),
          duration,
          context,
        ),
        const SizedBox(width: 15),
        _buildInfoBox(
          Icons.star_border,
          "Best Time to Visit".tr(),
          bestTime,
          context,
        ),
      ],
    );
  }

  Widget _buildInfoBox(IconData icon, String title, String value, context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.card(context),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFF0D6EFD), size: 20),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
