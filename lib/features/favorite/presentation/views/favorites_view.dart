import 'package:dalil_syria/core/shered/widgets/heder.dart';
import 'package:dalil_syria/features/trips/presentation/views/trip_details_view.dart';

import 'package:flutter/material.dart';
import '../widgets/favorite_item_card.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: Column(
        children: [
          Heder(
            section_name: "Favorites",
            second_name: "Your saved trips and places",
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                FavoriteItemCard(
                  title: "Ancient Palmyra Expedition",
                  location: "Palmyra, Homs",
                  duration: "3 Days",
                  price: "\$120",
                  imagePath: "images/imag 1.jpg",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TripDetailsView(),
                      ),
                    );
                  },
                  onDelete: () {},
                ),
                FavoriteItemCard(
                  title: "Damascus Old City Tour",
                  location: "Damascus, Syria",
                  duration: "1 Day",
                  price: "\$45",
                  imagePath: "images/imag 1.jpg",
                  onTap: () {},
                  onDelete: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
