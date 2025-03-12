import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/icons.dart';
import 'package:flutter_hw_1/widgets/cat_swiper_provider.dart';
import 'package:provider/provider.dart' show ReadContext;

class UndoButton extends StatelessWidget {
  const UndoButton({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('undo');
    final onPressed = context.read<CatSwiperProvider>().onRevoke;
    return IconButton(
      onPressed: onPressed,
      color: Colors.blue,
      icon: Icon(AppIcons.undo),
    );
  }
}
