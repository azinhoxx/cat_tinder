import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw_1/widgets/base/paw_loading_indicator.dart';

class ImageContainer extends StatelessWidget {
  final BoxFit fit;
  final String imageUrl;
  final BorderRadiusGeometry? borderRadius;

  const ImageContainer({
    super.key,
    required this.fit,
    required this.imageUrl,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, imageUrl) => const PawLoadingIndicator(),
      errorWidget: (context, url, error) {
        return const Icon(Icons.error, size: 80, color: Colors.redAccent);
      },
      fadeOutDuration: const Duration(milliseconds: 300),
      imageBuilder:
          (context, imageProvider) => DecoratedBox(
            position: DecorationPosition.foreground,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              image: DecorationImage(image: imageProvider, fit: fit),
            ),
          ),
    );
  }
}
