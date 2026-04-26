import 'package:dalil_syria/core/shered/widgets/heder.dart';

import 'package:dalil_syria/features/profile/presentation/widgets/settings_section.dart';
import 'package:dalil_syria/features/profile/presentation/widgets/user_info_card.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Heder(section_name: "Profile", second_name: "Manage your account"),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Transform.translate(
                    offset: const Offset(0, -25),
                    child: const UserInfoCard(),
                  ),

                  const SettingsSection(),

                  const SizedBox(height: 20),
                  const Text(
                    "Dalil Syria v1.0.0",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
