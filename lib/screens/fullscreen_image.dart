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
                    minScale: 0.4,
                    maxScale: 3.0,
                    imageProvider: CachedNetworkImageProvider(cat.imageUrl),
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
