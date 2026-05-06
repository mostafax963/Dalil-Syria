import 'package:dalil_syria/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OfficeHeader extends StatelessWidget {
  final String imageUrl;
  const OfficeHeader({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
          child: Image.network(
            imageUrl,
            height: 340,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        Positioned(
          top: 50,
          left: 20,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              backgroundColor: AppColors.card(context),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.textPrimary(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
