import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/icons.dart';
import 'package:flutter_hw_1/widgets/cat_swiper_provider.dart';
import 'package:provider/provider.dart' show ReadContext;

class DislikeButton extends StatelessWidget {
  const DislikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('dislike');
    final onPressed = context.read<CatSwiperProvider>().onDislike;
    return IconButton(
      onPressed: onPressed,
      color: Colors.red,
      icon: Icon(AppIcons.dislike),
    );
  }
}
