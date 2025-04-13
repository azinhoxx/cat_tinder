import 'package:cat_tinder/features/cat_profiles/presentation/models/cat_list_item_model.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app_colors.dart';

class CardProgressBar extends StatelessWidget {
  final CatListItemModel<int> item;

  const CardProgressBar({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.0,
      children: [
        Text.rich(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          TextSpan(
            children: [
              TextSpan(
                text: '${item.label} ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: '(${item.value} / 5)'),
            ],
          ),
        ),
        LinearProgressIndicator(
          value: item.value / 5,
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          color: Colors.redAccent,
          minHeight: 20,
          backgroundColor: AppColors.backgroundProgressBar,
        ),
      ],
    );
  }
}
