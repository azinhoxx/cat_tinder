import 'package:flutter/material.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/dislike_button.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/like_button.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/undo_button.dart';

class BottomActionsRow extends StatelessWidget {
  const BottomActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4.0,
        children: <Widget>[DislikeButton(), LikeButton(), UndoButton()],
      ),
    );
  }
}
