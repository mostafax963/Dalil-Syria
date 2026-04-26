import 'package:flutter/material.dart';

class SettingsSwitch extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool value;
  final ValueChanged<bool>? onChanged;

  const SettingsSwitch({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 22, color: const Color(0xFF7D848D)),
        const SizedBox(width: 12),
        Expanded(child: Text(title)),
        Switch(value: value, onChanged: onChanged),
      ],
    );
  }
}
