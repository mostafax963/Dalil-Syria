import 'package:dalil_syria/core/providers/app_providers.dart';

import 'package:dalil_syria/features/auth/presentation/providers/auth_provider.dart';
import 'package:dalil_syria/features/auth/presentation/views/login_view.dart';
import 'package:dalil_syria/features/auth/presentation/views/onboarding_view.dart';
import 'package:dalil_syria/features/auth/presentation/widgets/splash_central_wedget.dart';
import 'package:dalil_syria/features/main/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    final session = ref.read(sessionServiceProvider);
    final auth = ref.read(authProvider.notifier);

    final isFirstTime = session.isFirstTime();
    final isLoggedIn = auth.isLoggedIn();

    if (isFirstTime) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingView()),
      );
    } else if (!isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginView()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2FA8FE), Color(0xFF0B6DFC)],
          ),
        ),
        child: Column(
          children: [
            const Expanded(child: Center(child: SplashCentralWidget())),

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
