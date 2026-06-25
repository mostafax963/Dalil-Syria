import 'package:dalil_syria/core/providers/app_providers.dart';
import 'package:dalil_syria/core/theme/app_colors.dart';
import 'package:dalil_syria/features/auth/presentation/views/login_view.dart';
import 'package:dalil_syria/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/shered/widgets/custom_button.dart';

class OnboardingView extends ConsumerStatefulWidget {
  const OnboardingView({super.key});

  @override
  ConsumerState<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<OnboardingView> {
  final PageController _pageController = PageController();
  double _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "onboarding_title_1".tr(),
      "description": "onboarding_desc_1".tr(),
      "image": "images/o1.jpeg",
      "icon": "explore",
    },
    {
      "title": "onboarding_title_2".tr(),
      "description": "onboarding_desc_2".tr(),
      "image": "images/o2.jpeg",
      "icon": "calendar_month",
    },
    {
      "title": "onboarding_title_3".tr(),
      "description": "onboarding_desc_3".tr(),
      "image": "images/o3.jpeg",
      "icon": "location_on",
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background(context),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              ref.read(sessionServiceProvider).completeOnboarding();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginView()),
              );
            },
            child: Text(
              "onboarding_skip".tr(),
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return OnboardingContent(
                    image: onboardingData[index]["image"]!,
                    title: onboardingData[index]["title"]!,
                    description: onboardingData[index]["description"]!,
                    icon: _getIcon(index),
                  );
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onboardingData.length, (index) {
                double selectedPercent = (1.0 - (_currentPage - index).abs())
                    .clamp(0.0, 1.0);
                return Container(
                  height: 6,
                  width: 8 + (14 * selectedPercent),
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.lerp(
                      const Color(0xFFD1E4FF),
                      const Color(0xFF0D6EFD),
                      selectedPercent,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),

            CustomButton(
              text: _currentPage.round() == onboardingData.length - 1
                  ? "onboarding_get_started".tr()
                  : "onboarding_next".tr(),
              onPressed: () {
                if (_currentPage < onboardingData.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  ref.read(sessionServiceProvider).completeOnboarding();

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginView()),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  IconData _getIcon(int index) {
    if (index == 0) return Icons.explore_outlined;
    if (index == 1) return Icons.calendar_month_outlined;
    return Icons.location_on_outlined;
  }
}
