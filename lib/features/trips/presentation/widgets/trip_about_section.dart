import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:flutter/material.dart';

class TripAboutSection extends StatelessWidget {
  const TripAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppCard(
      title: "About This Trip",
      child: Text("Journey through time as you explore..."),
    );
  }
}
