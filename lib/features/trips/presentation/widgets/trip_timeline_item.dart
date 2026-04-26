import 'package:dalil_syria/features/trips/presentation/widgets/timeline_painter.dart';
import 'package:flutter/material.dart';

class TripTimelineItem extends StatelessWidget {
  final String day, title, desc;
  final bool isFirst, isLast;

  const TripTimelineItem({
    super.key,
    required this.day,
    required this.title,
    required this.desc,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: 20,
            child: CustomPaint(
              painter: TimelinePainter(
                isFirst: isFirst,
                isLast: isLast,
                lineColor: const Color(0xFF0D6EFD),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    day,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D6EFD),
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(desc),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
