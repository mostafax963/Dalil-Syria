import 'package:dalil_syria/core/shered/widgets/async_value_widget.dart';
import 'package:dalil_syria/features/home/presentation/providers/home_provider.dart';
import 'package:dalil_syria/features/home/presentation/providers/home_search_provider.dart';
import 'package:dalil_syria/features/home/presentation/widgets/tourism_office_card.dart';
import 'package:dalil_syria/features/offices/presentation/views/office_details_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeOfficesSection extends ConsumerWidget {
  const HomeOfficesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final officesAsync = ref.watch(officesProvider);
    final search = ref.watch(homeSearchProvider);

    return SizedBox(
      height: 220,

      child: AsyncValueWidget(
        value: officesAsync,

        onRetry: () => ref.invalidate(officesProvider),

        data: (offices) {
          final filtered = offices.where((office) {
            return office.name.toLowerCase().contains(search);
          }).toList();

          if (filtered.isEmpty) {
            return Center(child: Text("home_no_offices".tr()));
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 24),
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final office = filtered[index];

              return TourismOfficeCard(
                rating: office.rating,
                imageUrl: office.image,
                name: office.name,
                reviews_count: office.reviewsCount,
                index: index,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OfficeDetailsView(officeId: office.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
