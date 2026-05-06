import 'package:dalil_syria/core/shered/widgets/home_header.dart';
import 'package:dalil_syria/features/attractions/presentation/PROVIDERS/attraction_provider.dart';
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
  String searchQuery = "";
  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text.toLowerCase();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncData = ref.watch(attractionsProvider);

    return Scaffold(
      body: Column(
        children: [
          HomeHeader(
            controller: searchController,
            main_text: "attractions_title".tr(),
            scandry_text: "attractions_subtitle".tr(),
            hint_text: "attractions_search_hint".tr(),
          ),

          Expanded(
            child: asyncData.when(
              loading: () => const Center(child: CircularProgressIndicator()),

              error: (e, _) => const Center(child: Text("Error")),

              data: (list) {
                final filteredList = list.where((item) {
                  final title = item.title.toLowerCase();
                  return title.contains(searchQuery);
                }).toList();

                if (filteredList.isEmpty) {
                  return Center(child: Text("No results found".tr()));
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
                            builder: (_) => AttractionDetailsView(id: item.id),
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
    );
  }
}
