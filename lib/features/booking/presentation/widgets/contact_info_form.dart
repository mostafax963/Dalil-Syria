import 'package:dalil_syria/core/shered/widgets/custom_text_field_booking.dart';

import 'package:flutter/material.dart';

class ContactInfoForm extends StatelessWidget {
  const ContactInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact Information",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        CustomTextFieldBooking(label: "Full Name", hint: "John Doe"),
        CustomTextFieldBooking(label: "Email", hint: "your.email@example.com"),
        CustomTextFieldBooking(label: "Phone Number", hint: "+963 xxx xxx xxx"),
      ],
    );
  }
}
