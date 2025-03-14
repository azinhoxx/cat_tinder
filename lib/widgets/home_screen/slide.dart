import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/decorations.dart';
import 'package:flutter_hw_1/models/cat_model.dart';
import 'package:flutter_hw_1/screens/details_screen.dart';
import 'package:flutter_hw_1/widgets/base/image_container.dart';
import 'package:flutter_hw_1/providers/cat_model_provider.dart';
import 'package:flutter_hw_1/widgets/home_screen/blur_overlay.dart';
import 'package:flutter_hw_1/widgets/home_screen/slide_container.dart';

class Slide extends StatelessWidget {
  final CatModel cat;

  const Slide({super.key, required this.cat});

  void _navigateDetailsScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder:
            (context) =>
                CatModelProvider(cat: cat, child: const DetailsScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDecorations.defaultBorderRadius),
      ),
      onTap: () => _navigateDetailsScreen(context),
      child: SlideContainer(
        children: <Widget>[
          ImageContainer(fit: BoxFit.cover, imageUrl: cat.imageUrl),
          if (cat.name != null)
            Positioned.fill(
              top: null,
              child: BlurOverlay(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: DefaultTextStyle(
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    child: Column(
                      children: <Widget>[
                        Text(
                          cat.name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        if (cat.origin != null) Text(cat.origin!),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
