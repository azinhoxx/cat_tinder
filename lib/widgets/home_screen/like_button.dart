import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/icons.dart';
import 'package:flutter_hw_1/providers/swiper_provider.dart';
import 'package:provider/provider.dart' show Provider, SelectContext;

class LikeButton extends StatelessWidget {
  const LikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final likes = context.select<SwiperProvider, int>(
      (provider) => provider.likesCount,
    );
    final onPressed =
        Provider.of<SwiperProvider>(context, listen: false).onLike;

    return IconButton(
      onPressed: onPressed,
      color: Colors.green,
      icon: Row(
        spacing: 8.0,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(AppIcons.like),
          Container(
            constraints: BoxConstraints(
              minWidth: _calculateWidthTextLikes(likes),
            ),
            child: Text(
              '$likes',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  double _calculateWidthTextLikes(int count) {
    final textPainter = TextPainter(
      text: TextSpan(text: '$count'),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.width + 10;
  }
}
