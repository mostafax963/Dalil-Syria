import 'package:flutter/material.dart';

class Heder extends StatelessWidget {
  final String section_name;
  final String second_name;
  final IconData icon_name;
  final VoidCallback? onTap;

  Heder({
    super.key,
    required this.section_name,
    required this.second_name,
    required this.icon_name,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
      decoration: const BoxDecoration(
        color: Color(0xFF0D6EFD),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onTap,
                icon: Icon(icon_name, size: 25, color: Colors.white),
              ),
              SizedBox(width: 10),
              Text(
                section_name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            second_name,
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
