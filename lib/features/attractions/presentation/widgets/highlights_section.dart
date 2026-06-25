import 'package:dalil_syria/core/theme/app_colors.dart';
import 'package:dalil_syria/features/attractions/domain/entities/highlight_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HighlightsSection extends StatelessWidget {
  final List<HighlightEntity> highlights;

  const HighlightsSection({super.key, required this.highlights});

  @override
  Widget build(BuildContext context) {
    if (highlights.isEmpty) {
      return Text("attractions_no_highlights".tr());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Highlights".tr(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: highlights
              .map((h) => _buildChip(h.title, context))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildChip(String label, context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.card(context),
        border: Border.all(color: AppColors.card(context)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF0D6EFD), size: 14),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
