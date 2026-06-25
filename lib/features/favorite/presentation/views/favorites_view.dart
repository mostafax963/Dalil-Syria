import 'package:dalil_syria/core/shered/widgets/heder.dart';
import 'package:dalil_syria/features/favorite/presentation/provider/favorites_provider.dart';
import 'package:dalil_syria/features/favorite/presentation/widgets/favorite_item_card.dart';
import 'package:dalil_syria/features/home/presentation/providers/home_provider.dart';

import 'package:dalil_syria/features/trips/presentation/views/trip_details_view.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesProvider);

    final tripsAsync = ref.watch(tripsProvider);

    final favIds = favoritesState.favorites;

    return Scaffold(
      body: Column(
        children: [
          Heder(
            section_name: "favorites_title".tr(),
            second_name: "favorites_subtitle".tr(),
            icon_name: Icons.favorite,
          ),

          if (favoritesState.error != null)
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                favoritesState.error!,
                style: const TextStyle(color: Colors.red),
              ),
            ),

          Expanded(
            child: favoritesState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : favIds.isEmpty
                ? Center(child: Text("favorites_empty".tr()))
                : tripsAsync.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),

                    error: (e, _) => Center(child: Text(e.toString())),

                    data: (trips) {
                      final favoriteTrips = trips.where((trip) {
                        return favIds.contains(trip.id);
                      }).toList();

                      if (favoriteTrips.isEmpty) {
                        return Center(child: Text("favorites_empty".tr()));
                      }

                      return ListView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: favoriteTrips.length,
                        itemBuilder: (context, index) {
                          final trip = favoriteTrips[index];

                          return FavoriteItemCard(
                            title: trip.title,
                            location: trip.location,
                            duration: "${trip.durationDays} ${"Days".tr()}",
                            price: "\$${trip.price}",
                            imagePath: trip.image,

                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      TripDetailsView(tripId: trip.id),
                                ),
                              );
                            },

                            onDelete: () {
                              ref
                                  .read(favoritesProvider.notifier)
                                  .toggle(trip.id);
                            },
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
