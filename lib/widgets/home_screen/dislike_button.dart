import 'package:flutter/material.dart';
import 'package:cat_tinder/constants/icons.dart';
import 'package:cat_tinder/providers/swiper_provider.dart';
import 'package:provider/provider.dart' show Provider, SelectContext;

class DislikeButton extends StatelessWidget {
  const DislikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final VoidCallback onPressed =
        Provider.of<SwiperProvider>(context, listen: false).onDislike;

    final bool disabled = context.select<SwiperProvider, bool>(
      (provider) => provider.isNotNextSlide,
    );

    return IconButton(
      onPressed: disabled ? null : onPressed,
      color: Colors.red,
      icon: const Icon(AppIcons.dislike),
    );
  }
}
