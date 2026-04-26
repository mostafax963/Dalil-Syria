import 'package:dalil_syria/features/auth/presentation/views/onboarding_view.dart';
import 'package:dalil_syria/features/auth/presentation/widgets/splash_central_wedget.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingView()),
      );
    });
    super.initState();
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
