import 'package:flutter/material.dart';

class TripIncludedItem extends StatelessWidget {
  final String text;

  const TripIncludedItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check_circle, color: Color(0xFF0D6EFD)),
        const SizedBox(width: 12),
        Expanded(child: Text(text)),
      ],
    );
  }
}
