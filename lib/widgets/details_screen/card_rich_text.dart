import 'package:flutter/material.dart';
import 'package:cat_tinder/constants/icons.dart';

class CardRichText extends StatelessWidget {
  final String label;
  final TextSpan child;

  const CardRichText({super.key, required this.label, required this.child});

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
              children: [
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                child,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
