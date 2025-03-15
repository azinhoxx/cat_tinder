import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/decorations.dart';
import 'package:flutter_hw_1/constants/icons.dart';
import 'package:flutter_hw_1/widgets/base/paw_loading_indicator.dart';

class ImageContainer extends StatefulWidget {
  final BorderRadiusGeometry borderRadius;
  final BoxFit fit;
  final String imageUrl;

  const ImageContainer({
    super.key,
    required this.borderRadius,
    required this.fit,
    required this.imageUrl,
  });

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  late UniqueKey _imageRenderMethodKey;

  @override
  void initState() {
    super.initState();
    _imageRenderMethodKey = UniqueKey();
  }

  void _retryRequest() {
    setState(() {
      _imageRenderMethodKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: _imageRenderMethodKey,
      imageUrl: widget.imageUrl,
      placeholder: (context, imageUrl) => const PawLoadingIndicator(),
      errorWidget:
          (context, url, error) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(AppDecorations.defaultBorderRadius),
              ),
            ),
            child: Center(
              child: IconButton(
                padding: const EdgeInsets.all(40.0),
                onPressed: _retryRequest,
                icon: const Icon(AppIcons.refresh),
              ),
            ),
          ),
      fadeOutDuration: const Duration(milliseconds: 300),
      imageBuilder:
          (context, imageProvider) => DecoratedBox(
            position: DecorationPosition.foreground,
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius,
              image: DecorationImage(image: imageProvider, fit: widget.fit),
            ),
          ),
    );
  }
}
