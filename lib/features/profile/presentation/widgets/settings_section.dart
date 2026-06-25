import 'package:dalil_syria/core/providers/language_provider.dart';
import 'package:dalil_syria/core/providers/notification_toggle_provider.dart';
import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:dalil_syria/core/providers/theme_provider.dart';

import 'package:dalil_syria/features/profile/presentation/widgets/settings_item.dart';
import 'package:dalil_syria/features/profile/presentation/widgets/settings_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "profile_settings".tr(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          Consumer(
            builder: (context, ref, _) {
              final isEnabled = ref.watch(notificationToggleProvider);

              return SettingsSwitch(
                title: "profile_notifications".tr(),
                icon: Icons.notifications_none_outlined,
                value: isEnabled,
                onChanged: (value) {
                  ref.read(notificationToggleProvider.notifier).toggle(value);
                },
              );
            },
          ),

          Consumer(
            builder: (context, ref, _) {
              final themeMode = ref.watch(themeProvider);
              final isDark = themeMode == ThemeMode.dark;

              return SettingsSwitch(
                title: "profile_dark_mode".tr(),
                icon: Icons.dark_mode_outlined,
                value: isDark,
                onChanged: (value) {
                  ref.read(themeProvider.notifier).toggleTheme(value);
                },
              );
            },
          ),
          SizedBox(height: 10),
          Consumer(
            builder: (context, ref, _) {
              return SettingsItem(
                title: "profile_language".tr(),
                icon: Icons.language,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text("English"),
                            onTap: () async {
                              await context.setLocale(const Locale('en'));
                              if (context.mounted) {}
                              ref
                                  .read(languageProvider.notifier)
                                  .changeLanguage(context, const Locale('en'));
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: const Text("العربية"),
                            onTap: () {
                              ref
                                  .read(languageProvider.notifier)
                                  .changeLanguage(context, const Locale('ar'));
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),

          const Divider(height: 30),

          SettingsItem(
            title: "profile_account_settings".tr(),
            icon: Icons.settings_outlined,
          ),

          SettingsItem(title: "profile_about".tr(), icon: Icons.info_outline),

          SettingsItem(title: "profile_support".tr(), icon: Icons.mail_outline),
        ],
      ),
    );
  }
}
