import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:dalil_syria/features/profile/presentation/widgets/settings_item.dart';
import 'package:dalil_syria/features/profile/presentation/widgets/settings_switch.dart';
import 'package:flutter/material.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Settings", style: TextStyle(fontWeight: FontWeight.bold)),

          const SizedBox(height: 15),

          SettingsSwitch(
            title: "Notifications",
            icon: Icons.notifications_none_outlined,
            value: true,
          ),

          SettingsSwitch(
            title: "Dark Mode",
            icon: Icons.dark_mode_outlined,
            value: false,
          ),

          const Divider(height: 30),

          SettingsItem(
            title: "My Bookings",
            icon: Icons.calendar_today_outlined,
          ),

          SettingsItem(
            title: "Account Settings",
            icon: Icons.settings_outlined,
          ),

          SettingsItem(title: "About Dalil Syria", icon: Icons.info_outline),

          SettingsItem(title: "Contact Support", icon: Icons.mail_outline),
        ],
      ),
    );
  }
}
