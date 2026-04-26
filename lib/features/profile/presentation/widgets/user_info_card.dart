import 'package:dalil_syria/features/profile/presentation/widgets/user_info_row.dart';
import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    const Color textColor = Color(0xFF7D848D);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundColor: Color(0xFF0D6EFD),
                child: Icon(Icons.person, color: Colors.white, size: 40),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Ahmad Mohammad",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "ahmad@example.com",
                      style: TextStyle(color: textColor, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          UserInfoRow(icon: Icons.phone_outlined, text: "+963 11 xxx xxxx"),
          UserInfoRow(
            icon: Icons.location_on_outlined,
            text: "Damascus, Syria",
          ),
          UserInfoRow(
            icon: Icons.calendar_month_outlined,
            text: "Member since April 2026",
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFE5E7EB)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Edit Profile",
                style: TextStyle(color: Color(0xFF0D6EFD)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
