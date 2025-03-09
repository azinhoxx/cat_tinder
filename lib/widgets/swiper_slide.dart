import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_hw_1/widgets/blinking_paw.dart';

class SwiperSlide extends StatelessWidget {
  final Map<String, dynamic> data;

  const SwiperSlide({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final imageUrl = data['url'] as String;
    final name = data['breeds'][0]['name'] as String;
    final origin = data['breeds'][0]['origin'] as String;

    return GestureDetector(
      onTap: () {},
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Center(child: _buildCard(imageUrl, name, origin)),
      ),
    );
  }

  Widget _buildCard(String imageUrl, String name, String origin) {
    final borderRadius = const BorderRadius.all(Radius.circular(18));

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 8)],
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: SizedBox(
            child: Stack(
              children: [
                _buildImage(imageUrl),
                Positioned.fill(
                  top: null,
                  child: Stack(
                    children: [
                      _buildBlurOverlay(),
                      _buildBreedInfo(name, origin),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return Positioned.fill(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => BlinkingPaw(),
        fadeOutDuration: const Duration(milliseconds: 400),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildBlurOverlay() {
    return Positioned.fill(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(color: Colors.black38),
        ),
      ),
    );
  }

  Widget _buildBreedInfo(String name, String origin) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(origin, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
