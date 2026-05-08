import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AttractionImageHeader extends StatelessWidget {
  final String image;
  final String title;
  final String location;

  const AttractionImageHeader({
    super.key,
    required this.image,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,

          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),

          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),

        Positioned(
          bottom: 30,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.white70),
                  Text(location, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 40,
          left: 20,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
