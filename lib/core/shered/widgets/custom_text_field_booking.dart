import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:flutter/material.dart';

class CustomTextFieldBooking extends StatelessWidget {
  final String label;
  final String hint;

  const CustomTextFieldBooking({
    super.key,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        AppCard(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
