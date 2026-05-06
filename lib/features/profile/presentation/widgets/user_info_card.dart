import 'package:dalil_syria/core/theme/app_colors.dart';
import 'package:dalil_syria/features/profile/presentation/widgets/user_info_row.dart';
import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String city;
  final String createdAt;

  const UserInfoCard({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF7D848D);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card(context),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 35, child: Icon(Icons.person)),
              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 18)),
                    Text(email, style: const TextStyle(color: textColor)),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 30),
          const SizedBox(height: 20),

          UserInfoRow(icon: Icons.phone, text: phone),
          SizedBox(height: 10),
          UserInfoRow(icon: Icons.location_on, text: city),
          SizedBox(height: 10),
          UserInfoRow(icon: Icons.calendar_month, text: createdAt),
        ],
      ),
    );
  }
}
