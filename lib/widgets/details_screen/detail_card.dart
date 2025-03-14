import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/decorations.dart';
import 'package:flutter_hw_1/models/cat_model.dart';
import 'package:flutter_hw_1/screens/fullscreen_image.dart';
import 'package:flutter_hw_1/widgets/base/image_container.dart';
import 'package:flutter_hw_1/widgets/details_screen/card_progress_bar.dart';
import 'package:flutter_hw_1/providers/cat_model_provider.dart';
import 'package:flutter_hw_1/widgets/details_screen/card_rich_text.dart';
import 'package:url_launcher/url_launcher.dart';

class CatDetailCard extends StatelessWidget {
  const CatDetailCard({super.key});

  void _navigateFullScreen({
    required BuildContext context,
    required CatModel cat,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder:
            (context) => CatModelProvider(cat: cat, child: FullscreenImage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cat = CatModelProvider.of(context).cat;

    final itemsIntegerValues = _buildItems<int>(
      items: cat.toIntegerValuesList(),
      builder:
          (el) => CardProgressBar(
            key: ValueKey(el),
            label: el.label,
            value: el.value!,
          ),
    );

    final itemsStringValues = _buildItems<String>(
      items: cat.toStringValuesList(),
      builder: (el) {
        return CardRichText(
          key: ValueKey(el),
          label: el.label,
          child:
              el.label.toLowerCase().contains('wikipedia')
                  ? TextSpan(
                    text: el.value!,
                    style: const TextStyle(color: Colors.blueAccent),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            final url = Uri.parse(el.value!);
                            launchUrl(url);
                          },
                  )
                  : TextSpan(text: el.value!),
        );
      },
    );

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
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
            Flexible(
              child: InkWell(
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
              ),
            ),
            Flexible(
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
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
                      final isSmallScreen = constraints.maxWidth < 350;
                      return Container(
                        margin: const EdgeInsets.only(top: 12.0),
                        child: Column(
                          spacing: 16.0,
                          children:
                              isSmallScreen
                                  ? itemsIntegerValues
                                  : <Widget>[
                                    for (
                                      int i = 0;
                                      i < itemsIntegerValues.length;
                                      i += 2
                                    )
                                      Row(
                                        spacing: 12.0,
                                        children: [
                                          Flexible(
                                            child: itemsIntegerValues[i],
                                          ),
                                          if (i + 1 < itemsIntegerValues.length)
                                            Flexible(
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
