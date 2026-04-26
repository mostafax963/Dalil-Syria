import 'package:flutter/material.dart';

class UserInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const UserInfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(icon, size: 18), const SizedBox(width: 10), Text(text)],
    );
  }
}
