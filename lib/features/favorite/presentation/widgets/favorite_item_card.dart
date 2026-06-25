import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalil_syria/core/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FavoriteItemCard extends StatelessWidget {
  final String title;
  final String location;
  final String duration;
  final String price;
  final String imagePath;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const FavoriteItemCard({
    super.key,
    required this.title,
    required this.location,
    required this.duration,
    required this.price,
    required this.imagePath,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    const Color textColor = Color(0xFF7D848D);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.card(context),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      width: 90,
                      height: 90,
                      imageUrl: imagePath,
                      fit: BoxFit.cover,

                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),

                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary(context),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: textColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              location,
                              style: const TextStyle(
                                color: textColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  size: 14,
                                  color: textColor,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  duration,
                                  style: const TextStyle(
                                    color: textColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              price,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0D6EFD),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1, color: Color(0xFFF1F1F1)),

          TextButton(
            onPressed: onDelete,
            style: TextButton.styleFrom(
              minimumSize: const Size(double.infinity, 45),
              foregroundColor: Colors.redAccent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delete_outline, size: 18),
                SizedBox(width: 8),
                Text(
                  "Remove from favorites".tr(),
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
