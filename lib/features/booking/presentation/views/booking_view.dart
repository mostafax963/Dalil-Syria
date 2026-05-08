import 'package:dalil_syria/core/providers/notification_service_provider.dart';
import 'package:dalil_syria/core/providers/notification_toggle_provider.dart';
import 'package:dalil_syria/core/shered/widgets/custom_button.dart';
import 'package:dalil_syria/core/shered/widgets/heder.dart';
import 'package:dalil_syria/features/booking/presentation/widgets/booking_options.dart';
import 'package:dalil_syria/features/booking/presentation/widgets/contact_info_form.dart';
import 'package:dalil_syria/features/booking/presentation/widgets/price_breakdown.dart';
import 'package:dalil_syria/features/booking/presentation/widgets/trip_summary_card.dart';
import 'package:dalil_syria/features/booking/presentation/provider/booking_provider.dart';
import 'package:dalil_syria/features/main/presentation/views/main_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingView extends ConsumerStatefulWidget {
  final dynamic trip;

  const BookingView({super.key, required this.trip});

  @override
  ConsumerState<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends ConsumerState<BookingView> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  num guests = 1;
  DateTime? selectedDate;

  num get totalPrice => guests * widget.trip.price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Heder(
            section_name: "booking_title".tr(),
            second_name: "booking_subtitle".tr(),
            icon_name: Icons.arrow_back,
            onTap: () => Navigator.pop(context),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TripSummaryCard(trip: widget.trip),

                  const SizedBox(height: 25),

                  BookingOptions(
                    guests: guests,
                    onAdd: () {
                      if (guests < 15) setState(() => guests++);
                    },
                    onRemove: () {
                      if (guests > 1) setState(() => guests--);
                    },
                    onDatePick: () async {
                      final picked = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      );

                      if (picked != null) {
                        setState(() => selectedDate = picked);
                      }
                    },
                    selectedDate: selectedDate,
                  ),

                  const SizedBox(height: 25),

                  ContactInfoForm(
                    fullNameController: fullNameController,
                    emailController: emailController,
                    phoneController: phoneController,
                  ),

                  const SizedBox(height: 20),

                  PriceBreakdown(price: widget.trip.price, guests: guests),

                  const SizedBox(height: 30),

                  CustomButton(
                    text: "booking_confirm".tr(),
                    onPressed: () async {
                      if (fullNameController.text.trim().isEmpty ||
                          emailController.text.trim().isEmpty ||
                          phoneController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("booking_fill_fields".tr())),
                        );
                        return;
                      }
                      if (selectedDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("booking_select_date_error".tr()),
                          ),
                        );
                        return;
                      }

                      await ref.read(
                        createBookingProvider({
                          "tripId": widget.trip.id,
                          "fullName": fullNameController.text.trim(),
                          "email": emailController.text.trim(),
                          "phone": phoneController.text.trim(),
                          "date": selectedDate!.toIso8601String().split('T')[0],
                          "guests": guests.toInt(),
                        }).future,
                      );
                      ref.invalidate(bookingsProvider);
                      final isEnabled = ref.read(notificationToggleProvider);

                      if (isEnabled) {
                        await ref
                            .read(notificationServiceProvider)
                            .showNotification(
                              title: "notifications_title".tr(),
                              body: "body".tr() + "${widget.trip.title}",
                            );
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("booking_success".tr())),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => MainView()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
