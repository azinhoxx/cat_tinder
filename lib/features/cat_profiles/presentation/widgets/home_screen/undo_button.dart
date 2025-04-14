import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app/app_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UndoButton extends StatelessWidget {
  const UndoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) => state.isFirstSlide,
      builder: (context, isStart) {
        return IconButton(
          onPressed:
              isStart ? null : context.read<HomeCubit>().swiperService.undo,
          color: Colors.blue,
          icon: const Icon(AppIcons.undo),
        );
      },
    );
  }
}
