import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';

class ImageFullScreen extends StatelessWidget {
  final String url;

  const ImageFullScreen({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              PhotoView(
                maxScale: PhotoViewComputedScale.contained * 5,
                minScale: PhotoViewComputedScale.contained,
                initialScale: PhotoViewComputedScale.contained,
                imageProvider: CachedNetworkImageProvider(url),
              ),
              Positioned(
                top: 6.0,
                right: 6.0,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close, size: 20),
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
