import 'package:dalil_syria/features/attractions/presentation/views/attraction_details_view.dart';
import 'package:dalil_syria/core/shered/widgets/home_header.dart';

import 'package:flutter/material.dart';
import '../widgets/attraction_card.dart';

class AttractionsView extends StatelessWidget {
  const AttractionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: Column(
        children: [
          HomeHeader(
            main_text: "Attractions",
            scandry_text: "Discover amazing places",
            hint_text: "Search attractions...",
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                AttractionCard(
                  title: "Palmyra Ruins",
                  location: "Homs Governorate",
                  description:
                      "Ancient Semitic city with magnificent Roman-era ruins.",
                  imagePath: "images/imag 1.jpg",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttractionDetailsView(),
                      ),
                    );
                  },
                ),
                AttractionCard(
                  title: "Umayyad Mosque",
                  location: "Damascus",
                  description:
                      "One of the largest and oldest mosques in the world.",
                  imagePath: "images/imag 1.jpg",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
