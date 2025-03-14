import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/decorations.dart';
import 'package:flutter_hw_1/models/cat_model.dart';
import 'package:flutter_hw_1/widgets/cat_card_progress_bar.dart';
import 'package:flutter_hw_1/widgets/cat_model_provider.dart';
import 'package:flutter_hw_1/widgets/cat_card_rich_text.dart';
import 'package:flutter_hw_1/widgets/paw_loading_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

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
      builder: (el) {
        if (el.label.toLowerCase().contains('wikipedia')) {
          return CatCardRichText(
            label: el.label,
            child: TextSpan(
              text: el.value!,
              style: const TextStyle(color: Colors.blueAccent),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      final uri = Uri.parse(el.value!);
                      launchUrl(uri);
                    },
            ),
          );
        }
        return CatCardRichText(
          key: ValueKey(el),
          label: el.label,
          child: TextSpan(text: el.value!),
        );
      },
    );

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
              child: ListView.separated(
                separatorBuilder:
                    (context, index) => const SizedBox(height: 4.0),
                padding: const EdgeInsets.all(12.0),
                itemCount:
                    itemsStringValues.length +
                    (itemsIntegerValues.isNotEmpty ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < itemsStringValues.length) {
                    return itemsStringValues[index];
                  }
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      final isSmallScreen = constraints.maxWidth < 440;
                      return Container(
                        margin: const EdgeInsets.only(top: 12.0),
                        child:
                            isSmallScreen
                                ? Column(
                                  spacing: 16.0,
                                  children: itemsIntegerValues,
                                )
                                : Column(
                                  spacing: 16.0,
                                  children: <Widget>[
                                    for (
                                      int i = 0;
                                      i < itemsIntegerValues.length;
                                      i += 2
                                    )
                                      Row(
                                        spacing: 12.0,
                                        children: [
                                          Expanded(
                                            child: itemsIntegerValues[i],
                                          ),
                                          if (i + 1 < itemsIntegerValues.length)
                                            Expanded(
                                              child: itemsIntegerValues[i + 1],
                                            ),
                                        ],
                                      ),
                                  ],
                                ),
                      );
                    },
                  );
                },
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
    return items.fold<List<Widget>>([], (list, el) {
      if (el.value != null && el.value.toString().isNotEmpty) {
        list.add(builder(el));
      }
      return list;
    });
  }
}
