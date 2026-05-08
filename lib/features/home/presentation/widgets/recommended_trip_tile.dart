import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RecommendedTripTile extends StatelessWidget {
  final String title, location, price;
  final int index;
  final VoidCallback? onTap;
  final String imageUrl;
  final int duration_nights;
  final int duration_days;
  const RecommendedTripTile({
    super.key,
    required this.title,
    required this.location,
    required this.price,

    required this.index,
    this.onTap,
    required this.imageUrl,
    required this.duration_nights,
    required this.duration_days,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 500 + (index * 100)),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: child,
          ),
        );
      },

      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: AppCard(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
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
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 14,
                          color: Colors.grey,
                        ),
                        Text(
                          " $location",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 14,
                          color: Color(0xFF0D6EFD),
                        ),
                        Text(
                          " $duration_days ${"Days".tr()}, $duration_nights ${"Nights".tr()}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  color: Color(0xFF0D6EFD),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
