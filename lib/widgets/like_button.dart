import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/icons.dart';
import 'package:flutter_hw_1/widgets/cat_swiper_provider.dart';
import 'package:provider/provider.dart' show Provider, SelectContext;

class LikeButton extends StatelessWidget {
  const LikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final likes = context.select<CatSwiperProvider, int>(
      (provider) => provider.likesCount,
    );
    final onPressed =
        Provider.of<CatSwiperProvider>(context, listen: false).onLike;
    return IconButton(
      onPressed: onPressed,
      color: Colors.green,
      icon: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 2.0),
          const Icon(AppIcons.like),
          const SizedBox(width: 8.0),
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
