import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app/app_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DislikeButton extends StatelessWidget {
  const DislikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    final bool disabled = context.select<HomeCubit, bool>(
      (cubit) => cubit.state.isEnd,
    );

    return IconButton(
      onPressed: disabled ? null : cubit.onDislike,
      color: Colors.red,
      icon: const Icon(AppIcons.dislike),
    );
  }
}
