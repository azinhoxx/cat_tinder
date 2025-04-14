import 'package:cat_tinder/features/cat_profiles/presentation/models/cat_list_item_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app/app_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class CardRichText extends StatelessWidget {
  final CatListItemModel<String> item;

  const CardRichText({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.0,
      children: <Widget>[
        const Icon(AppIcons.cat, size: 20, color: Colors.red),
        Expanded(
          child: Text.rich(
            TextSpan(
              style: const TextStyle(fontSize: 16),
              children: [
                TextSpan(
                  text: '${item.label}: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                item.value.startsWith(RegExp(r'^https?://'))
                    ? TextSpan(
                      text: item.value,
                      style: const TextStyle(color: Colors.blueAccent),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              final url = Uri.parse(item.value);
                              launchUrl(url);
                            },
                    )
                    : TextSpan(text: item.value + (item.suffix ?? '')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
