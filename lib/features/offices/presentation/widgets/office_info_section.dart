import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:dalil_syria/features/offices/domain/entities/office_entity.dart';
import 'package:dalil_syria/features/offices/presentation/widgets/office_contact_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OfficeInfoSection extends StatelessWidget {
  final OfficeEntity office;

  const OfficeInfoSection({super.key, required this.office});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          office.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        Text("${office.reviewsCount} ${"office_reviews".tr()}"),

        const SizedBox(height: 10),

        Row(
          children: [
            const Icon(Icons.location_on, size: 16),
            const SizedBox(width: 5),
            Expanded(child: Text(office.location)),
          ],
        ),

        const SizedBox(height: 20),

        AppCard(title: "office_about".tr(), child: Text(office.about)),

        const SizedBox(height: 20),

        AppCard(
          title: "office_contact".tr(),
          child: Column(
            children: [
              OfficeContactRow(icon: Icons.phone, text: office.phone),

              const Divider(),

              OfficeContactRow(icon: Icons.email, text: office.email),

              const Divider(),

              OfficeContactRow(icon: Icons.language, text: office.website),
            ],
          ),
        ),
      ],
    );
  }
}
