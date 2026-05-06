import 'package:dalil_syria/core/shered/widgets/heder.dart';
import 'package:dalil_syria/features/profile/presentation/provider/profile_provider.dart';
import 'package:dalil_syria/features/profile/presentation/widgets/logout_button.dart';
import 'package:dalil_syria/features/profile/presentation/widgets/settings_section.dart';
import 'package:dalil_syria/features/profile/presentation/widgets/user_info_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Heder(
              section_name: "profile_title".tr(),
              second_name: "profile_subtitle".tr(),
              icon_name: Icons.person,
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Transform.translate(
                    offset: const Offset(0, -25),
                    child: profileAsync.when(
                      loading: () => const CircularProgressIndicator(),
                      error: (e, _) => Text('Error: $e'),
                      data: (profile) => UserInfoCard(
                        name: profile.fullName,
                        email: profile.email,
                        phone: profile.phone,
                        city: profile.city,
                        createdAt: profile.createdAt,
                      ),
                    ),
                  ),
                  const SettingsSection(),
                  const LogoutButton(),
                  const SizedBox(height: 20),
                  Text(
                    "profile_version".tr(),
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
