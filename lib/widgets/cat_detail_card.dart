import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/decorations.dart';
import 'package:flutter_hw_1/models/cat_model.dart';
import 'package:flutter_hw_1/widgets/cat_card_progress_bar.dart';
import 'package:flutter_hw_1/widgets/cat_model_provider.dart';
import 'package:flutter_hw_1/widgets/cat_card_rich_text.dart';
import 'package:flutter_hw_1/widgets/paw_loading_indicator.dart';

class CatDetailCard extends StatelessWidget {
  const CatDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cat = CatModelProvider.of(context).cat;

    final itemsIntegerValues = _buildItems<int>(
      items: cat.toIntegerValuesList(),
      builder:
          (el) => CatCardProgressBar(
            key: ValueKey(el),
            label: el.label,
            value: el.value!,
          ),
    );

    final itemsStringValues = _buildItems<String>(
      items: cat.toStringValuesList(),
      builder:
          (el) => CatCardRichText(
            key: ValueKey(el),
            label: el.label,
            text: el.value!,
          ),
    );

    const gapY = 16.0;

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
              child: ListView(
                padding: const EdgeInsets.all(12.0),
                children: <Widget>[
                  ...itemsStringValues,
                  const SizedBox(height: gapY),
                  if (itemsIntegerValues.isNotEmpty)
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isSmallScreen = constraints.maxWidth < 440;
                        return isSmallScreen
                            ? Column(
                              spacing: gapY,
                              children:
                                  itemsIntegerValues.map((el) => el).toList(),
                            )
                            : Column(
                              spacing: gapY,
                              children: <Widget>[
                                for (
                                  int i = 0;
                                  i < itemsIntegerValues.length;
                                  i += 2
                                )
                                  Row(
                                    spacing: 12.0,
                                    children: [
                                      Expanded(child: itemsIntegerValues[i]),
                                      if (i + 1 < itemsIntegerValues.length)
                                        Expanded(
                                          child: itemsIntegerValues[i + 1],
                                        ),
                                    ],
                                  ),
                              ],
                            );
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildItems<T>({
    required List<CatModelListItem<T?>> items,
    required Widget Function(CatModelListItem<T?>) builder,
  }) {
    return items
        .where(
          (el) =>
              (el.value.toString() != 'null' && el.value.toString().isNotEmpty),
        )
        .map((el) => builder(el))
        .toList();
  }
}
