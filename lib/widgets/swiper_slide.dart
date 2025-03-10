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
    final breeds = data['breeds'][0];
    final name = breeds['name'] as String;
    final origin = breeds['origin'] as String;

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
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(30),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
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
          child: Container(color: Colors.black26),
        ),
      ),
    );
  }

  Widget _buildBreedInfo(String name, String origin) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(origin),
          ],
        ),
      ),
    );
  }
}
