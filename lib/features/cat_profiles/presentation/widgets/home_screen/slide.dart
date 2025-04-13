import 'package:cat_tinder/core/utils/constants/app_decorations.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/base/image_container.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/container_background.dart';
import 'package:go_router/go_router.dart';

class Slide extends StatelessWidget {
  final CatEntity cat;

  const Slide({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/details', extra: cat);
      },
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDecorations.defaultBorderRadius),
      ),
      child: Card(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ImageContainer(
              fit: BoxFit.cover,
              imageUrl: cat.url!,
              borderRadius: const BorderRadius.all(
                Radius.circular(AppDecorations.defaultBorderRadius),
              ),
            ),

            if (cat.breeds != null &&
                cat.breeds!.isNotEmpty &&
                cat.breeds?[0]?.name != null)
              Positioned.fill(
                top: null,
                child: ContainerBackground(
                  color: Colors.black54,
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
                            cat.breeds![0]!.name!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          if (cat.breeds?[0]?.origin != null)
                            Text(cat.breeds![0]!.origin!),
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
