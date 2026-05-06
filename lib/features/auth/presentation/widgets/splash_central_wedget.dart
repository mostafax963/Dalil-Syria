import 'package:dalil_syria/features/auth/presentation/widgets/three_bounce_dots.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplashCentralWidget extends StatefulWidget {
  const SplashCentralWidget({super.key});

  @override
  State<SplashCentralWidget> createState() => _SplashCentralWidgetState();
}

class _SplashCentralWidgetState extends State<SplashCentralWidget>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ScaleTransition(
            scale: _fadeAnimation,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Icon(
                  Icons.airplanemode_active,
                  color: Color(0xFF0D6EFD),
                  size: 40,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'app_name'.tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Explore Syria's Beauty".tr(),
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 30),

          const ThreeBounceDots(),
        ],
      ),
    );
  }
}
