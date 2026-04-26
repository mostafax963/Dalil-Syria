import 'package:dalil_syria/features/auth/presentation/views/login_view.dart';
import 'package:dalil_syria/features/auth/presentation/widgets/onboarding_content.dart';
import 'package:flutter/material.dart';
import '../../../../core/shered/widgets/custom_button.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  double _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Discover Syria",
      "description":
          "Explore ancient cities, beautiful landscapes, and rich cultural heritage",
      "image": "images/imag 1.jpg",
      "icon": "explore",
    },
    {
      "title": "Book Your Trip",
      "description":
          "Easy booking process with trusted tourism offices and flexible dates",
      "image": "images/imag 1.jpg",
      "icon": "calendar_month",
    },
    {
      "title": "Navigate with Ease",
      "description":
          "Interactive maps and detailed guides to help you explore every corner",
      "image": "images/imag 1.jpg",
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              );
            },
            child: const Text(
              "Skip",
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
                  ? "Get Started >"
                  : "Next >",
              onPressed: () {
                if (_currentPage < onboardingData.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
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
