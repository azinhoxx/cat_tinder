import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw_1/widgets/base/paw_loading_indicator.dart';

class ImageContainer extends StatelessWidget {
  final BoxFit fit;
  final String imageUrl;

  const ImageContainer({super.key, required this.fit, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, imageUrl) => const PawLoadingIndicator(),
      fadeOutDuration: const Duration(milliseconds: 300),
      fit: fit,
    );
  }
}
