import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalil_syria/core/shered/widgets/app_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TourismOfficeCard extends StatelessWidget {
  final String name;
  final int reviews_count;
  final double rating;
  final int index;
  final VoidCallback? onTap;
  final String imageUrl;
  const TourismOfficeCard({
    super.key,
    required this.name,
    required this.reviews_count,
    required this.index,
    this.onTap,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Stack(
                alignment: AlignmentGeometry.topRight,
                children: [
                  CachedNetworkImage(
                    width: 160,
                    height: 100,
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,

                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),

                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 50,
                      height: 20,

                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_sharp,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          Text(
                            rating.toString(),
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    "$reviews_count ${"office_reviews".tr()}",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
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
