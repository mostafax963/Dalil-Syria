import 'package:dalil_syria/core/providers/connection_provider.dart';
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
    final internetAsync = ref.watch(internetStatusProvider);
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
                    child: internetAsync.when(
                      loading: () => const CircularProgressIndicator(),

                      error: (e, __) => Center(
                        child: Text(e.toString(), textAlign: TextAlign.center),
                      ),

                      data: (connected) {
                        if (!connected) {
                          return Column(
                            children: [
                              const Icon(
                                Icons.wifi_off,
                                size: 50,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 10),

                              Text(
                                "coniction_state".tr(),
                                style: const TextStyle(fontSize: 16),
                              ),

                              const SizedBox(height: 15),

                              ElevatedButton(
                                onPressed: () {
                                  ref.invalidate(profileProvider);
                                  ref.invalidate(internetStatusProvider);
                                },
                                child: Text("error_try_again".tr()),
                              ),
                            ],
                          );
                        }

                        return profileAsync.when(
                          loading: () => const CircularProgressIndicator(),

                          error: (e, _) => Center(
                            child: Text(
                              e.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),

                          data: (profile) => UserInfoCard(
                            name: profile.fullName,
                            email: profile.email,
                            phone: profile.phone,
                            city: profile.city,
                            createdAt: profile.createdAt,
                          ),
                        );
                      },
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
