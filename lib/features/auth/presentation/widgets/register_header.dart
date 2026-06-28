import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to Dalil Syria".tr(),
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          "Create your account and start exploring".tr(),
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
