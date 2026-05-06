import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  final String description;

  const AboutSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About".tr(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(
            color: Color(0xFF7D848D),
            height: 1.5,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
