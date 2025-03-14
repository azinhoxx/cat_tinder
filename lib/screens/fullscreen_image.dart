import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hw_1/providers/cat_model_provider.dart';
import 'package:flutter_hw_1/widgets/base/image_container.dart';

class FullscreenImage extends StatelessWidget {
  const FullscreenImage({super.key});

  void _closeFullScreen(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

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
            child: GestureDetector(
              onTap: () => _closeFullScreen(context),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(color: Colors.black54),
                  Center(
                    child: InteractiveViewer(
                      child: GestureDetector(
                        onTap: () {},
                        child: ImageContainer(
                          imageUrl: cat.imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
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
      ),
    );
  }
}
