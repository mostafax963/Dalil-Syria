import 'package:dalil_syria/core/shered/widgets/heder.dart';
import 'package:dalil_syria/features/favorite/presentation/provider/favorites_provider.dart';
import 'package:dalil_syria/features/trips/presentation/provider/trip_provider.dart';
import 'package:dalil_syria/features/trips/presentation/views/trip_details_view.dart';
import 'package:dalil_syria/features/favorite/presentation/widgets/favorite_item_card.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favIds = ref.watch(favoritesProvider);

    return Scaffold(
      body: Column(
        children: [
          Heder(
            section_name: "favorites_title".tr(),
            second_name: "favorites_subtitle".tr(),
            icon_name: Icons.favorite,
          ),

          Expanded(
            child: favIds.isEmpty
                ? Center(child: Text("favorites_empty".tr()))
                : ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: favIds.length,
                    itemBuilder: (context, index) {
                      final id = favIds[index];

                      return FutureBuilder(
                        future: ref.read(tripDetailsProvider(id).future),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          final trip = snapshot.data!;

                          return FavoriteItemCard(
                            title: trip.title,
                            location: trip.location,
                            duration: "${trip.duration_days} ${"Days".tr()}",
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
