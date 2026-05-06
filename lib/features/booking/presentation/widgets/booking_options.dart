import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:dalil_syria/features/booking/presentation/widgets/booking_section_title.dart';
import 'package:dalil_syria/features/booking/presentation/widgets/counter_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BookingOptions extends StatelessWidget {
  final num guests;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onDatePick;
  final DateTime? selectedDate;

  const BookingOptions({
    super.key,
    required this.guests,
    required this.onAdd,
    required this.onRemove,
    required this.onDatePick,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookingSectionTitle(title: "Select Date".tr()),

        AppCard(
          child: InkWell(
            onTap: onDatePick,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? "Select Date".tr()
                          : selectedDate.toString().split(' ')[0],
                    ),
                  ),
                  const Icon(Icons.calendar_month_outlined),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

        BookingSectionTitle(title: "booking_num_guests".tr()),

        AppCard(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onRemove,
                child: CounterButton(icon: Icons.remove),
              ),
              Text(
                "$guests",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: onAdd,
                child: CounterButton(icon: Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
