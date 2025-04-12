import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app_icons.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/providers/swiper_provider.dart';
import 'package:provider/provider.dart' show Provider, SelectContext;

class UndoButton extends StatelessWidget {
  const UndoButton({super.key});

  @override
  Widget build(BuildContext context) {
    final VoidCallback onPressed =
        Provider.of<SwiperProvider>(context, listen: false).onRevoke;

    final bool disabled = context.select<SwiperProvider, bool>(
      (provider) => provider.isNotPrevSlide,
    );

    return IconButton(
      onPressed: disabled ? null : onPressed,
      color: Colors.blue,
      icon: const Icon(AppIcons.undo),
    );
  }
}
