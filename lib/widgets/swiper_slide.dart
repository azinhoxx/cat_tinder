import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_hw_1/screens/detail_screen.dart';
import 'package:flutter_hw_1/widgets/blinking_paw.dart';
import 'package:flutter_hw_1/widgets/blur_overlay.dart';
import 'package:flutter_hw_1/widgets/swiper_slide_container.dart';

class SwiperSlide extends StatelessWidget {
  final Map<String, dynamic> data;

  const SwiperSlide({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final imageUrl = data['url'] as String;
    final breeds = data['breeds'][0];
    final name = breeds['name'] as String;
    final origin = breeds['origin'] as String;

    return GestureDetector(
      onTap: () => _navigateDetailsScreen(context),
      child: SwiperSlideContainer(
        children: <Widget>[
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, imageUrl) => const BlinkingPaw(),
              fadeOutDuration: const Duration(milliseconds: 300),
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            top: null,
            child: BlurOverlay(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: DefaultTextStyle(
                  style: const TextStyle(color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(origin),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateDetailsScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (context) => CatDetailScreen(data: data),
      ),
    );
  }
}
