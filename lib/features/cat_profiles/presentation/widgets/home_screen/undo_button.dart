import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UndoButton extends StatelessWidget {
  const UndoButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    final bool disabled = context.select<HomeCubit, bool>(
      (cubit) => cubit.state.isStart,
    );

    return IconButton(
      onPressed: disabled ? null : cubit.onRevoke,
      color: Colors.blue,
      icon: const Icon(AppIcons.undo),
    );
  }
}
