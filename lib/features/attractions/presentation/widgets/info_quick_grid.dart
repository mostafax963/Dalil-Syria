import 'package:flutter/material.dart';

class InfoQuickGrid extends StatelessWidget {
  const InfoQuickGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildInfoBox(Icons.access_time, "Visit Duration", "4-6 hours"),
        const SizedBox(width: 15),
        _buildInfoBox(Icons.star_border, "Best Time", "Spring/Fall"),
      ],
    );
  }

  Widget _buildInfoBox(IconData icon, String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F8FA),
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
