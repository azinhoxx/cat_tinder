import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/icons.dart';
import 'package:flutter_hw_1/providers/swiper_provider.dart';
import 'package:provider/provider.dart' show Provider, Selector;

class LikeButton extends StatelessWidget {
  const LikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final VoidCallback onPressed =
        Provider.of<SwiperProvider>(context, listen: false).onLike;

    return Selector<SwiperProvider, bool>(
      selector: (context, provider) => provider.isNotNextSlide,
      builder: (context, disabled, child) {
        return IconButton(
          onPressed: disabled ? null : onPressed,
          color: Colors.green,
          icon: Row(
            spacing: 8.0,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(AppIcons.like),
              Selector<SwiperProvider, int>(
                selector: (context, provider) => provider.likesCount,
                builder:
                    (context, likes, child) => Container(
                      constraints: BoxConstraints(
                        minWidth: _calculateWidthTextLikes(likes),
                      ),
                      child: Text(
                        '$likes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                              disabled
                                  ? Theme.of(context).disabledColor
                                  : Colors.green,
                        ),
                      ),
                    ),
              ),
            ],
          ),
        );
      },
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
