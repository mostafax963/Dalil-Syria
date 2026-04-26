import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "About",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "Palmyra is an ancient archaeological site located in modern-day Syria. Since the 1st century AD, the city grew wealthy from trade caravans; in the 3rd century Palmyra became the capital of the Palmyrene Empire under the reign of Queen Zenobia.",
          style: TextStyle(color: Color(0xFF7D848D), height: 1.5, fontSize: 14),
        ),
      ],
    );
  }
}
