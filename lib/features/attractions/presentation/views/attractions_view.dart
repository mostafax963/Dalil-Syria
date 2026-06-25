import 'package:dalil_syria/core/shered/widgets/async_value_widget.dart';
import 'package:dalil_syria/core/shered/widgets/home_header.dart';
import 'package:dalil_syria/core/shered/widgets/network_aware_widget.dart';
import 'package:dalil_syria/features/attractions/presentation/PROVIDERS/attraction_provider.dart';
import 'package:dalil_syria/features/attractions/presentation/PROVIDERS/attraction_search_provider.dart';
import 'package:dalil_syria/features/attractions/presentation/views/attraction_details_view.dart';
import 'package:dalil_syria/features/attractions/presentation/widgets/attraction_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttractionsView extends ConsumerStatefulWidget {
  const AttractionsView({super.key});
  @override
  ConsumerState<AttractionsView> createState() => _AttractionsViewState();
}

class _AttractionsViewState extends ConsumerState<AttractionsView> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      ref.read(attractionsSearchProvider.notifier).state = searchController.text
          .toLowerCase();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncData = ref.watch(attractionsProvider);
    final searchQuery = ref.watch(attractionsSearchProvider);

    return NetworkAwareWidget(
      onRetry: () {
        ref.invalidate(attractionsProvider);
      },
      child: Scaffold(
        body: Column(
          children: [
            HomeHeader(
              controller: searchController,
              main_text: "attractions_title".tr(),
              scandry_text: "attractions_subtitle".tr(),
              hint_text: "attractions_search_hint".tr(),
            ),

            Expanded(
              child: AsyncValueWidget(
                value: asyncData,
                onRetry: () {
                  ref.invalidate(attractionsProvider);
                },

                data: (list) {
                  final filteredList = list.where((item) {
                    final title = item.title.toLowerCase();
                    return title.contains(searchQuery);
                  }).toList();

                  if (filteredList.isEmpty) {
                    return Center(child: Text("attractions_no_results".tr()));
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final item = filteredList[index];

                      return AttractionCard(
                        title: item.title,
                        location: item.location,
                        description: item.description,
                        imagePath: item.image,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  AttractionDetailsView(id: item.id),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
