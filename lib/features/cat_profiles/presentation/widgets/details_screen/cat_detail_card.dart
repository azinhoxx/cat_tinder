import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/mappers/cat_breed_to_list_mapper.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/models/cat_list_item_model.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/details_screen/card_progress_bar.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/details_screen/card_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app_decorations.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/details_screen/card_image_section.dart';

class CatDetailCard extends StatelessWidget {
  final CatEntity cat;

  const CatDetailCard({required this.cat, super.key});

  @override
  Widget build(BuildContext context) {
    final List<CatListItemModel<String>> stringItems =
        cat.toListItemsOfType<String>();
    final List<CatListItemModel<int>> integerItems =
        cat.toListItemsOfType<int>();

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppDecorations.defaultBorderRadius),
        ),
      ),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(child: CardImageSection(url: cat.url!)),
          Flexible(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              padding: const EdgeInsets.all(12.0),
              itemCount: stringItems.length + integerItems.length,
              itemBuilder: (context, index) {
                if (index < stringItems.length) {
                  return CardRichText(item: stringItems[index]);
                }
                return CardProgressBar(
                  item: integerItems[index - stringItems.length],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
