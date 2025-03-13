import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/decorations.dart';
import 'package:flutter_hw_1/widgets/cat_rich_text.dart';
import 'package:flutter_hw_1/widgets/paw_loading_indicator.dart';

class CatDetailCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const CatDetailCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final imageUrl = data['url'] as String;
    final breeds = data['breeds'][0];

    final name = breeds['name'] as String?;
    final origin = breeds['origin'] as String?;
    final description = breeds['description'] as String?;

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
          children: <Widget>[
            Expanded(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, imageUrl) => const PawLoadingIndicator(),
                fadeOutDuration: const Duration(milliseconds: 300),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6.0,
                children: <Widget>[
                  if (name != null) CatRichText(label: 'Name', text: name),
                  if (origin != null)
                    CatRichText(label: 'Origin', text: origin),
                  if (description != null)
                    CatRichText(label: 'Description', text: description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
