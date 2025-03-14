import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_hw_1/constants/decorations.dart';
import 'package:flutter_hw_1/models/cat_model.dart';
import 'package:flutter_hw_1/screens/cat_detail_screen.dart';
import 'package:flutter_hw_1/widgets/cat_model_provider.dart';
import 'package:flutter_hw_1/widgets/paw_loading_indicator.dart';
import 'package:flutter_hw_1/widgets/blur_overlay.dart';
import 'package:flutter_hw_1/widgets/cat_slide_container.dart';

class CatSlide extends StatelessWidget {
  final CatModel cat;

  const CatSlide({super.key, required this.cat});

  void _navigateDetailsScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder:
            (context) => CatModelProvider(cat: cat, child: CatDetailScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppDecorations.defaultBorderRadius),
      onTap: () => _navigateDetailsScreen(context),
      child: CatSlideContainer(
        children: <Widget>[
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: cat.imageUrl,
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
                      if (cat.name != null)
                        Text(
                          cat.name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      if (cat.origin != null) Text(cat.origin!),
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
