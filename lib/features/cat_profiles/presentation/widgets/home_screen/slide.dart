import 'package:cat_tinder/core/utils/constants/app/app_decorations.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/base/image_container.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/slide_description.dart';
import 'package:go_router/go_router.dart';

class Slide extends StatelessWidget {
  final CatEntity cat;

  const Slide({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.push('/details', extra: cat),
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

              if (cat.breeds!.isNotEmpty)
                SlideDescription(
                  name: cat.breeds![0]!.name!,
                  origin: cat.breeds?[0]?.origin,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
