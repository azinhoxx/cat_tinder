import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/icons.dart';

class CatCardRichText extends StatelessWidget {
  final String label;
  final String text;

  const CatCardRichText({super.key, required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.0,
      children: <Widget>[
        const Icon(AppIcons.cat, size: 20, color: Colors.red),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: text),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
