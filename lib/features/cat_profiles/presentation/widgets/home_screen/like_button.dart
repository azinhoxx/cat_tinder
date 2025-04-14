import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit/home_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit/home_state.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_state.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app/app_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final swiperService = context.read<HomeCubit>().swiperService;
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) => state.isLastSlide,
      builder: (context, isLastSlide) {
        return IconButton(
          onPressed: isLastSlide ? null : swiperService.swipeRight,
          color: Colors.green,
          icon: Row(
            spacing: 8.0,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(AppIcons.like),
              BlocSelector<LikedCatsCubit, LikedCatsState, int>(
                selector: (state) => state.likesCount,
                builder: (context, likesCount) {
                  return Container(
                    constraints: BoxConstraints(
                      minWidth: _calculateWidthTextLikes(likesCount),
                    ),
                    child: Text(
                      '$likesCount',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:
                            isLastSlide
                                ? Theme.of(context).disabledColor
                                : Colors.green,
                      ),
                    ),
                  );
                },
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
