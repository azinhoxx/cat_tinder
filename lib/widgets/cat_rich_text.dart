import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/icons.dart';

class CatRichText extends StatelessWidget {
  final String label;
  final String? text;

  const CatRichText({super.key, required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    return (text == null && text!.isNotEmpty)
        ? Container()
        : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(AppIcons.cat, size: 24, color: Colors.red),
            const SizedBox(width: 4.0),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$label: ',
                      style: DefaultTextStyle.of(
                        context,
                      ).style.copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: text,
                      style: DefaultTextStyle.of(context).style,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
  }
}
