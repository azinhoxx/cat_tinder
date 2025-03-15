import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/decorations.dart';
import 'package:flutter_hw_1/models/cat_model.dart';
import 'package:flutter_hw_1/providers/cat_model_provider.dart';
import 'package:flutter_hw_1/widgets/base/image_container.dart';

class CardImageSection extends StatelessWidget {
  const CardImageSection({super.key});

  void _navigateFullScreen({
    required BuildContext context,
    required CatModel cat,
  }) {
    Navigator.pushNamed(context, '/fullscreen', arguments: {'cat': cat});
  }

  @override
  Widget build(BuildContext context) {
    final cat = CatModelProvider.of(context).cat;

    return InkWell(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(AppDecorations.defaultBorderRadius),
      ),
      onTap: () => _navigateFullScreen(context: context, cat: cat),
      child: Stack(
        children: [
          Positioned.fill(
            child: ImageContainer(
              fit: BoxFit.cover,
              imageUrl: cat.imageUrl,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppDecorations.defaultBorderRadius),
              ),
            ),
          ),

          const Positioned(
            top: 16,
            right: 16,
            child: Icon(
              Icons.open_in_full_sharp,
              color: Colors.redAccent,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
