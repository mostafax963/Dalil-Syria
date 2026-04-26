import 'package:flutter/material.dart';

class TripInfoBadges extends StatelessWidget {
  const TripInfoBadges({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildBadge(Icons.access_time, "3 Days / 2 Nights"),
        const SizedBox(width: 15),
        _buildBadge(Icons.group_outlined, "Max 15"),
      ],
    );
  }

  Widget _buildBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF0D6EFD)),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF1B1E28),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
