import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_hw_1/screens/cat_detail_screen.dart';
import 'package:flutter_hw_1/widgets/paw_loading_indicator.dart';
import 'package:flutter_hw_1/widgets/blur_overlay.dart';
import 'package:flutter_hw_1/widgets/cat_slide_container.dart';

class CatSlide extends StatelessWidget {
  final Map<String, dynamic> data;

  const CatSlide({super.key, required this.data});

  void _navigateDetailsScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (context) => CatDetailScreen(data: data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = data['url'] as String;
    final breeds = data['breeds'][0];
    final name = breeds['name'] as String;
    final origin = breeds['origin'] as String;

    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      onTap: () => _navigateDetailsScreen(context),
      child: CatSlideContainer(
        children: <Widget>[
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, imageUrl) => const PawLoadingIndicator(),
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
}
