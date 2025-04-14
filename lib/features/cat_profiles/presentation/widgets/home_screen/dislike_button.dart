import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app/app_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DislikeButton extends StatelessWidget {
  const DislikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) => state.isLastSlide,
      builder: (context, isEnd) {
        return IconButton(
          onPressed:
              isEnd ? null : context.read<HomeCubit>().swiperService.swipeLeft,
          color: Colors.red,
          icon: const Icon(AppIcons.dislike),
        );
      },
    );
  }
}
