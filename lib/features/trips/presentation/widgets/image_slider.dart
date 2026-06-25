import 'package:dalil_syria/core/shered/widgets/app_cached_image.dart';
import 'package:dalil_syria/features/favorite/presentation/provider/favorites_provider.dart';
import 'package:dalil_syria/features/trips/presentation/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageSlider extends StatefulWidget {
  final List<String> images;
  final String tripId;

  const ImageSlider({super.key, required this.images, required this.tripId});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final images = widget.images.isEmpty
        ? ["https://via.placeholder.com/400x300?text=No+Image"]
        : widget.images;

    return Stack(
      children: [
        CarouselSlider(
          items: images.map((item) {
            return AppCachedImage(
              imageUrl: item,
              width: double.infinity,
              height: 380,
              fit: BoxFit.cover,
            );
          }).toList(),

          carouselController: _controller,

          options: CarouselOptions(
            height: 380,
            viewportFraction: 1.0,
            autoPlay: images.length > 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),

        Positioned(
          top: 50,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildOverlayActionButton(
                Icons.arrow_back,
                () => Navigator.pop(context),
              ),
              Consumer(
                builder: (context, ref, _) {
                  final favs = ref.watch(favoritesProvider);
                  final isFav = favs.favorites.contains(widget.tripId);

                  return FavoriteButton(
                    isFav: isFav,
                    onTap: () => ref
                        .read(favoritesProvider.notifier)
                        .toggle(widget.tripId),
                  );
                },
              ),
            ],
          ),
        ),

        if (images.length > 1)
          Positioned(
            top: 180,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavArrow(
                  Icons.chevron_left,
                  () => _controller.previousPage(),
                ),
                _buildNavArrow(
                  Icons.chevron_right,
                  () => _controller.nextPage(),
                ),
              ],
            ),
          ),

        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.asMap().entries.map((entry) {
              final index = entry.key;

              return GestureDetector(
                onTap: () => _controller.animateToPage(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _currentIndex == index ? 20 : 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(
                      _currentIndex == index ? 0.9 : 0.4,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildOverlayActionButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }

  Widget _buildNavArrow(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}
