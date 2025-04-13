import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app/app_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final onPressed = context.read<HomeCubit>().onLike;
        final disabled = state.isEnd;

        return IconButton(
          onPressed: disabled ? null : onPressed,
          color: Colors.green,
          icon: Row(
            spacing: 8.0,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(AppIcons.like),
              Container(
                constraints: BoxConstraints(
                  minWidth: _calculateWidthTextLikes(state.likesCount),
                ),
                child: Text(
                  '${state.likesCount}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        disabled
                            ? Theme.of(context).disabledColor
                            : Colors.green,
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
