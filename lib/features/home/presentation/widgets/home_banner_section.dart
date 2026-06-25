import 'package:dalil_syria/core/shered/widgets/async_value_widget.dart';
import 'package:dalil_syria/features/home/presentation/providers/home_provider.dart';
import 'package:dalil_syria/features/home/presentation/providers/home_search_provider.dart';
import 'package:dalil_syria/features/home/presentation/widgets/special_offer_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBannerSection extends ConsumerWidget {
  const HomeBannerSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(homeSearchProvider);

    if (search.isNotEmpty) {
      return const SizedBox();
    }

    final bannersAsync = ref.watch(bannersProvider);

    return AsyncValueWidget(
      value: bannersAsync,

      onRetry: () => ref.invalidate(bannersProvider),

      data: (banners) {
        if (banners.isEmpty) {
          return Center(child: Text("home_no_offers".tr()));
        }

        final banner = banners.first;

        return SpecialOfferCard(
          imageUrl: banner.image,
          title: banner.title,
          description: banner.description,
        );
      },
    );
  }
}
