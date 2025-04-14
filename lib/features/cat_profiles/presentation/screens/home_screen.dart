import 'package:cat_tinder/core/base_components/paw_loading_indicator.dart';
import 'package:cat_tinder/core/utils/constants/is_splash_supported.dart';
import 'package:cat_tinder/core/utils/helpers/show_error_dialog_helper/show_error_dialog_helper.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/core/base_components/cat_scaffold.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/bottom_actions_row.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/swiper_card_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CatScaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listenWhen:
            (prev, curr) =>
                (prev.errorMessage, prev.isEnd) !=
                (curr.errorMessage, curr.isEnd),
        listener: (context, state) {
          final String? errorMessage = state.errorMessage;

          if (Navigator.canPop(context)) {
            Navigator.of(context, rootNavigator: true).pop();
          }

          if (errorMessage != null && state.isEnd) {
            showErrorDialog(
              context,
              errorMessage: errorMessage,
              onRetry: () async {
                await context.read<HomeCubit>().fetchSlides();
              },
            );
          }
        },
        buildWhen:
            (previous, current) =>
                previous.isFirstLoading != current.isFirstLoading ||
                previous.isEmpty != current.isEmpty,
        builder: (context, state) {
          if (state.isFirstLoading && kIsSplashSupportedPlatform) {
            return const SizedBox.shrink();
          }

          if (state.isEmpty) {
            return const PawLoadingIndicator();
          }

          return const Column(
            children: <Widget>[
              Expanded(child: SwiperCardList()),
              BottomActionsRow(),
            ],
          );
        },
      ),
    );
  }
}
