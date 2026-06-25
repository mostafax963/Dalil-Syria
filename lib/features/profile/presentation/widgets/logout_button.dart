import 'package:dalil_syria/features/auth/presentation/views/login_view.dart';
import 'package:dalil_syria/features/booking/presentation/Provider/booking_provider.dart';
import 'package:dalil_syria/features/favorite/presentation/provider/favorites_provider.dart';
import 'package:dalil_syria/features/profile/presentation/provider/profile_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        try {
          await ref.read(logoutUseCaseProvider).call();

          ref.invalidate(profileProvider);
          ref.invalidate(favoritesProvider);
          ref.invalidate(bookingsProvider);

          if (context.mounted) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginView()),
              (route) => false,
            );
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("coniction_state".tr())));
          }
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.logout, color: Colors.red, size: 18),
            const SizedBox(width: 8),
            Text(
              "profile_logout".tr(),
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
