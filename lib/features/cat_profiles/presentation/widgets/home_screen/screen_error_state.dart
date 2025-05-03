import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit/home_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/base/error_dialog/error_dialog_button.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenErrorState extends StatelessWidget {
  final String message;

  const ScreenErrorState({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16.0,
      children: [
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
        ),
        ErrorDialogButton(
          onRetry: () => context.read<HomeCubit>().fetchSlides(),
        ),
      ],
    );
  }
}
