import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/mappers/cat_breed_to_list_mapper.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/models/cat_list_item_model.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/details_screen/card_progress_bar.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/details_screen/card_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/details_screen/card_image_section.dart';
import 'package:go_router/go_router.dart';

class CatDetailCard extends StatelessWidget {
  final CatEntity cat;

  const CatDetailCard({required this.cat, super.key});

  @override
  Widget build(BuildContext context) {
    final List<CatListItemModel<String>> stringItems =
        cat.toListItemsOfType<String>();
    final List<CatListItemModel<int>> integerItems =
        cat.toListItemsOfType<int>();
    const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 12.0);

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.push('/fullscreen', extra: cat.url),
                child: CardImageSection(url: cat.url!),
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              itemCount: stringItems.length + integerItems.length + 1,
              itemBuilder: (context, index) {
                if (index < stringItems.length) {
                  return Padding(
                    padding: horizontalPadding,
                    child: Column(
                      children: [
                        CardRichText(item: stringItems[index]),
                        if (index != stringItems.length - 1) const Divider(),
                      ],
                    ),
                  );
                }

                if (index == stringItems.length) {
                  return const Divider();
                }

                final adjustedIndex = index - stringItems.length - 1;
                return Padding(
                  padding: horizontalPadding.copyWith(
                    bottom:
                        adjustedIndex == integerItems.length - 1 ? 0.0 : 8.0,
                  ),
                  child: CardProgressBar(item: integerItems[adjustedIndex]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
