import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/icons.dart';
import 'package:flutter_hw_1/providers/swiper_provider.dart';
import 'package:provider/provider.dart' show Provider, SelectContext;

class LikeButton extends StatelessWidget {
  const LikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final values = context.select<SwiperProvider, ({int likes, bool disabled})>(
      (provider) => (
        likes: provider.likesCount,
        disabled: provider.isNotNextSlide,
      ),
    );

    final onPressed =
        Provider.of<SwiperProvider>(context, listen: false).onLike;

    final Color color =
        values.disabled ? Theme.of(context).disabledColor : Colors.green;

    return IconButton(
      onPressed: values.disabled ? null : onPressed,
      color: Colors.green,
      icon: Row(
        spacing: 8.0,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(AppIcons.like),
          Container(
            constraints: BoxConstraints(
              minWidth: _calculateWidthTextLikes(values.likes),
            ),
            child: Text(
              '${values.likes}',
              textAlign: TextAlign.center,
              style: TextStyle(color: color),
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
