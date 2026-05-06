import 'package:dalil_syria/features/home/presentation/providers/home_provider.dart';
import 'package:dalil_syria/features/home/presentation/widgets/section_header.dart';
import 'package:dalil_syria/features/offices/presentation/views/office_details_view.dart';

import 'package:dalil_syria/features/trips/presentation/views/trip_details_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/shered/widgets/home_header.dart';
import '../widgets/special_offer_card.dart';
import '../widgets/tourism_office_card.dart';
import '../widgets/recommended_trip_tile.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final searchFocusNode = FocusNode();
  final searchController = TextEditingController();
  String searchQuery = "";
  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text.toLowerCase();
      });
      searchFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final officesAsync = ref.watch(officesProvider);
    final tripsAsync = ref.watch(tripsProvider);
    final bannersAsync = ref.watch(bannersProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeHeader(
              controller: searchController,
              searchFocusNode: searchFocusNode,
              main_text: 'home_title'.tr(),
              scandry_text: "home_subtitle".tr(),
              hint_text: "home_search_hint".tr(),
            ),
            if (searchQuery.isEmpty)
              bannersAsync.when(
                loading: () => const Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                ),
                error: (e, _) => Text("home_failed_offers".tr()),
                data: (banners) {
                  if (banners.isEmpty) {
                    return Text("home_no_offers".tr());
                  }

                  final banner = banners.first;

                  return SpecialOfferCard(
                    imageUrl: banner.image,
                    title: banner.title,
                    description: banner.description,
                  );
                },
              ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SectionHeader(title: "home_tourism_offices".tr()),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 220,
              child: officesAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (e, _) =>
                    Center(child: Text("home_failed_offices".tr())),

                data: (offices) {
                  final filteredOffices = offices.where((office) {
                    final name = office.name.toLowerCase();
                    return name.contains(searchQuery);
                  }).toList();

                  if (filteredOffices.isEmpty) {
                    return Center(child: Text("home_no_offices".tr()));
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 24),
                    itemCount: filteredOffices.length,
                    itemBuilder: (context, index) {
                      final office = filteredOffices[index];

                      return TourismOfficeCard(
                        rating: office.rating,
                        imageUrl: office.image,
                        name: office.name,
                        reviews_count: office.reviews_count,
                        index: index,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  OfficeDetailsView(officeId: office.id),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  SectionHeader(title: "home_recommended_trips".tr()),
                  tripsAsync.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),

                    error: (e, _) =>
                        Center(child: Text("home_failed_trips $e".tr())),

                    data: (trips) {
                      final filteredTrips = trips.where((trip) {
                        final title = trip.title.toLowerCase();
                        final location = trip.location.toLowerCase();
                        final price = trip.price.toString();

                        return title.contains(searchQuery) ||
                            location.contains(searchQuery) ||
                            price.contains(searchQuery);
                      }).toList();

                      if (filteredTrips.isEmpty) {
                        return Center(child: Text("home_no_trips".tr()));
                      }

                      return Column(
                        children: filteredTrips.asMap().entries.map((entry) {
                          final index = entry.key;
                          final trip = entry.value;

                          return RecommendedTripTile(
                            imageUrl: trip.image,
                            title: trip.title,
                            location: trip.location,
                            price: "\$${trip.price}",
                            duration_days: trip.duration_days,
                            duration_nights: trip.duration_nights,
                            index: index,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      TripDetailsView(tripId: trip.id),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      );
                    },
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
