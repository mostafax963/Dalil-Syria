import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AvailableTripCard extends StatelessWidget {
  final String title, duration, price;
  final VoidCallback? onTap;
  final String imageUrl;
  const AvailableTripCard({
    super.key,
    required this.title,
    required this.duration,
    required this.price,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppCard(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                width: 90,
                height: 90,
                imageUrl: imageUrl,
                fit: BoxFit.cover,

                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),

                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${"Duration".tr()} : $duration",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    price,
                    style: const TextStyle(
                      color: Color(0xFF0D6EFD),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
