import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/decorations.dart';
import 'package:flutter_hw_1/models/cat_model.dart';
import 'package:flutter_hw_1/widgets/base/image_container.dart';
import 'package:flutter_hw_1/widgets/home_screen/container_background.dart';

class Slide extends StatelessWidget {
  final CatModel cat;

  const Slide({super.key, required this.cat});

  void _navigateDetailsScreen(BuildContext context) {
    Navigator.pushNamed(context, '/details', arguments: {'cat': cat});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDecorations.defaultBorderRadius),
      ),
      onTap: () => _navigateDetailsScreen(context),
      child: Card(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ImageContainer(
              fit: BoxFit.cover,
              imageUrl: cat.imageUrl,
              borderRadius: const BorderRadius.all(
                Radius.circular(AppDecorations.defaultBorderRadius),
              ),
            ),

            if (cat.name != null)
              Positioned.fill(
                top: null,
                child: ContainerBackground(
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
      ),
    );
  }
}
