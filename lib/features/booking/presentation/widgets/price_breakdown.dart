import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PriceBreakdown extends StatelessWidget {
  final num price;
  final num guests;

  const PriceBreakdown({super.key, required this.price, required this.guests});

  @override
  Widget build(BuildContext context) {
    final total = price * guests;

    return AppCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("booking_price_per_person".tr()), Text("\$$price")],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("booking_num_guests".tr()), Text("×$guests")],
          ),
          const Divider(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "booking_total".tr(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("\$$total"),
            ],
          ),
        ],
      ),
    );
  }
}
