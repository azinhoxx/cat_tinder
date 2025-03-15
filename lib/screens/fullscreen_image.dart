import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hw_1/providers/cat_model_provider.dart';
import 'package:photo_view/photo_view.dart';

class FullscreenImage extends StatelessWidget {
  const FullscreenImage({super.key});

  void _closeFullScreen(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    final cat = CatModelProvider.of(context).cat;

    return Scaffold(
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
              fit: StackFit.expand,
              children: [
                PhotoView(
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.black54,
                  ),
                  minScale: 0.4,
                  maxScale: 3.0,
                  imageProvider: CachedNetworkImageProvider(cat.imageUrl),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CloseButton(
                    onPressed: () => _closeFullScreen(context),
                    color: Colors.red,
                    style: const ButtonStyle(
                      iconSize: WidgetStatePropertyAll(32.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
