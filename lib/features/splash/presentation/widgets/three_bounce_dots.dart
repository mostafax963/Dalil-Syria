import 'package:flutter/material.dart';

class ThreeBounceDots extends StatefulWidget {
  const ThreeBounceDots({super.key});

  @override
  State<ThreeBounceDots> createState() => _ThreeBounceDotsState();
}

class _ThreeBounceDotsState extends State<ThreeBounceDots>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  final List<Animation<double>> _animations = [];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(3, (index) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
      )..repeat(reverse: true);
    });

    for (int i = 0; i < 3; i++) {
      _animations.add(
        Tween<double>(begin: 0, end: -10).animate(
          CurvedAnimation(
            parent: _controllers[i],
            curve: Interval(0.0, 1.0, curve: Curves.easeInOut),
          ),
        ),
      );

      Future.delayed(Duration(milliseconds: i * 200), () {
        if (mounted) _controllers[i].forward();
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _animations[index].value),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
