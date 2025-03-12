import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/icons.dart';

class LikeButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final int count;

  const LikeButton({super.key, this.onPressed, required this.count});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: Colors.green,
      icon: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 2.0),
          Icon(AppIcons.like),
          const SizedBox(width: 8.0),
          Container(
            constraints: BoxConstraints(minWidth: _calculateWidthTextLikes()),
            child: Text(
              '$count',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  double _calculateWidthTextLikes() {
    final textPainter = TextPainter(
      text: TextSpan(text: '$count'),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.width + 10;
  }
}
