import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hw_1/widgets/cat_model_provider.dart';
import 'package:flutter_hw_1/widgets/paw_loading_indicator.dart';

class FullScreenImageScreen extends StatelessWidget {
  const FullScreenImageScreen({super.key});

  void _closeFullScreen(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    final cat = CatModelProvider.of(context).cat;

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(child: Container(color: Colors.black54)),
            Positioned.fill(
              child: InteractiveViewer(
                child: CachedNetworkImage(
                  imageUrl: cat.imageUrl,
                  placeholder:
                      (context, imageUrl) => const PawLoadingIndicator(),
                  fadeOutDuration: const Duration(milliseconds: 300),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: CloseButton(
                color: Colors.red,
                style: const ButtonStyle(
                  iconSize: WidgetStatePropertyAll(32.0),
                ),
                onPressed: () => _closeFullScreen(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
