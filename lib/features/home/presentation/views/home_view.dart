import 'package:dalil_syria/core/shered/widgets/home_header.dart';
import 'package:dalil_syria/core/shered/widgets/network_aware_widget.dart';
import 'package:dalil_syria/features/home/presentation/providers/home_provider.dart';
import 'package:dalil_syria/features/home/presentation/providers/home_search_provider.dart';
import 'package:dalil_syria/features/home/presentation/widgets/home_banner_section.dart';
import 'package:dalil_syria/features/home/presentation/widgets/home_offices_section.dart';
import 'package:dalil_syria/features/home/presentation/widgets/home_trips_section.dart';
import 'package:dalil_syria/features/home/presentation/widgets/section_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final searchFocusNode = FocusNode();
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      ref.read(homeSearchProvider.notifier).state = searchController.text
          .toLowerCase();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NetworkAwareWidget(
      onRetry: () {
        ref.invalidate(officesProvider);
        ref.invalidate(tripsProvider);
        ref.invalidate(bannersProvider);
      },

      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(
                controller: searchController,
                searchFocusNode: searchFocusNode,
                main_text: 'home_title'.tr(),
                scandry_text: "home_subtitle".tr(),
                hint_text: "home_search_hint".tr(),
              ),

              const HomeBannerSection(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SectionHeader(title: "home_tourism_offices".tr()),
              ),

              const SizedBox(height: 10),

              const HomeOfficesSection(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    SectionHeader(title: "home_recommended_trips".tr()),

                    const HomeTripsSection(),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
