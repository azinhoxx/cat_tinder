import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/icons.dart';

class CatRichText extends StatelessWidget {
  final String label;
  final String text;

  const CatRichText({super.key, required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Icon(AppIcons.cat, size: 24, color: Colors.red.shade400),
          ),
          TextSpan(
            text: ' $label: ',
            style: DefaultTextStyle.of(
              context,
            ).style.copyWith(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: text, style: DefaultTextStyle.of(context).style),
        ],
      ),
    );
  }
}
