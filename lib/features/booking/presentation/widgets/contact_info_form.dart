import 'package:dalil_syria/core/shered/widgets/custom_text_field_booking.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ContactInfoForm extends StatefulWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const ContactInfoForm({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.phoneController,
  });

  @override
  State<ContactInfoForm> createState() => _ContactInfoFormState();
}

class _ContactInfoFormState extends State<ContactInfoForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact Information".tr(),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 15),

        CustomTextFieldBooking(
          controller: widget.fullNameController,
          label: "booking_full_name".tr(),
          hint: "booking_full_name_hint".tr(),
        ),

        CustomTextFieldBooking(
          controller: widget.emailController,
          label: "booking_email".tr(),
          hint: "booking_email_hint".tr(),
        ),

        CustomTextFieldBooking(
          controller: widget.phoneController,
          label: "booking_phone".tr(),
          hint: "booking_phone_hint".tr(),
        ),
      ],
    );
  }
}
