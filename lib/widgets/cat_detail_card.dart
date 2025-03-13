import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/decorations.dart';
import 'package:flutter_hw_1/widgets/cat_model_provider.dart';
import 'package:flutter_hw_1/widgets/cat_rich_text.dart';
import 'package:flutter_hw_1/widgets/paw_loading_indicator.dart';

class CatDetailCard extends StatelessWidget {
  const CatDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cat = CatModelProvider.of(context).cat;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDecorations.defaultBorderRadius),
        ),
      ),
      color: Colors.white,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDecorations.defaultBorderRadius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: CachedNetworkImage(
                width: double.infinity,
                imageUrl: cat.imageUrl,
                placeholder: (context, imageUrl) => const PawLoadingIndicator(),
                fadeOutDuration: const Duration(milliseconds: 300),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(12.0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    CatRichText(label: 'Name', text: cat.name),
                    CatRichText(label: 'Origin', text: cat.origin),
                    CatRichText(label: 'Description', text: cat.description),
                    CatRichText(label: 'Temperament', text: cat.temperament),
                    CatRichText(label: 'Lifespan', text: cat.lifeSpan),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
