import 'package:flutter/material.dart';

class OfficeContactRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const OfficeContactRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF0D6EFD)),
        const SizedBox(width: 12),
        Text(text),
      ],
    );
  }
}
