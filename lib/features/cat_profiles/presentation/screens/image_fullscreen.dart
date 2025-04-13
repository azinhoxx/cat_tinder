import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';

class ImageFullScreen extends StatelessWidget {
  final String url;

  const ImageFullScreen({required this.url, super.key});

  void _closeFullScreen(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: KeyboardListener(
              focusNode: FocusNode()..requestFocus(),
              onKeyEvent: (value) {
                if (value.logicalKey == LogicalKeyboardKey.escape) {
                  _closeFullScreen(context);
                }
              },
              child: Stack(
                children: [
                  PhotoView(
                    maxScale: PhotoViewComputedScale.contained * 5,
                    minScale: PhotoViewComputedScale.contained,
                    initialScale: PhotoViewComputedScale.contained,
                    imageProvider: CachedNetworkImageProvider(url),
                  ),

                  const Positioned(
                    top: 6.0,
                    left: 6.0,
                    child: BackButton(
                      color: Colors.red,
                      style: ButtonStyle(
                        iconSize: WidgetStatePropertyAll(28.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
