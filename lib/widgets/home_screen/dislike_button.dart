import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/icons.dart';
import 'package:flutter_hw_1/providers/swiper_provider.dart';
import 'package:provider/provider.dart' show Provider;

class DislikeButton extends StatelessWidget {
  const DislikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final onPressed =
        Provider.of<SwiperProvider>(context, listen: false).onDislike;
    return IconButton(
      onPressed: onPressed,
      color: Colors.red,
      icon: const Icon(AppIcons.dislike),
    );
  }
}
