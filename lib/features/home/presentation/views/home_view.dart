import 'package:dalil_syria/features/home/presentation/widgets/section_header.dart';
import 'package:dalil_syria/features/offices/presentation/views/office_details_view.dart';
import 'package:dalil_syria/features/trips/presentation/views/trip_details_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/shered/widgets/home_header.dart';
import '../widgets/special_offer_card.dart';
import '../widgets/tourism_office_card.dart';
import '../widgets/recommended_trip_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeHeader(
              main_text: "Discover Syria",
              scandry_text: "Find your next adventure",
              hint_text: "Search destinations, trips...",
            ),

            const SpecialOfferCard(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SectionHeader(title: "Tourism Offices"),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 24),
                children: [
                  TourismOfficeCard(
                    name: "Damascus Heritage Tours",
                    rating: "4.8",
                    index: 0,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OfficeDetailsView(),
                        ),
                      );
                    },
                  ),
                  const TourismOfficeCard(
                    name: "Palmyra Gate Agency",
                    rating: "4.5",
                    index: 1,
                  ),
                  const TourismOfficeCard(
                    name: "Aleppo Star Travel",
                    rating: "4.7",
                    index: 2,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  SectionHeader(title: "Recommended Trips"),
                  RecommendedTripTile(
                    title: "Ancient Palmyra",
                    location: "Palmyra, Homs",
                    price: "\$120",
                    days: '1',
                    index: 0,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripDetailsView(),
                        ),
                      );
                    },
                  ),
                  const RecommendedTripTile(
                    title: "Damascus Old City",
                    location: "Damascus",
                    price: "\$45",
                    days: '2',
                    index: 1,
                  ),
                  const RecommendedTripTile(
                    title: "Mediterranean Coast",
                    location: "Lattakia",
                    price: "\$85",
                    days: '3',
                    index: 2,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
