import 'package:cat_tinder/core/common_domain/entities/based_api_result/error_result_model.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_state.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/base/error_dialog/error_dialog_button.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/base/paw_loading_indicator.dart';
import 'package:cat_tinder/core/utils/constants/is_splash_supported.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit/home_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/base/cat_scaffold.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/bottom_actions_row.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/swiper_card_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CatScaffold(
      body: BlocListener<HomeCubit, HomeState>(
        listenWhen: (prev, curr) => prev.error != curr.error,
        listener: (context, state) {
          // final String? errorMessage = state.errorMessage;

          // if (Navigator.canPop(context)) {
          //   Navigator.of(context, rootNavigator: true).pop();
          // }

          // if (errorMessage != null && state.isLastSlide &&) {
          //   showErrorDialog(
          //     context,
          //     errorMessage: errorMessage,
          //     onRetry: () async {
          //       await context.read<HomeCubit>().fetchSlides();
          //     },
          //   );
          // }
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen:
              (previous, current) =>
                  previous.isFirstLoading != current.isFirstLoading ||
                  (current.isEmpty && current.error != previous.error),
          builder:
              (
                homeContext,
                homeState,
              ) => BlocBuilder<LikedCatsCubit, LikedCatsState>(
                buildWhen:
                    (previous, current) =>
                        previous.isFirstLoading != current.isFirstLoading,
                builder: (likedContext, likedState) {
                  if (kIsSplashSupportedPlatform) {
                    if (homeState.isFirstLoading || likedState.isFirstLoading) {
                      return const SizedBox.shrink();
                    } else {
                      FlutterNativeSplash.remove();
                    }
                  }

                  if (homeState.isFirstLoading || likedState.isFirstLoading) {
                    return const PawLoadingIndicator();
                  }

                  if (homeState.isEmpty &&
                      homeState.error?.type == ErrorType.networkError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 16.0,
                      children: [
                        const Text(
                          'No network connection\nLiked cats are still available',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21.0,
                          ),
                        ),
                        ErrorDialogButton(
                          onRetry:
                              () => context.read<HomeCubit>().fetchSlides(),
                        ),
                      ],
                    );
                  }

                  if (homeState.isEmpty) {
                    return const Text(
                      'There are no cats 🙀 \nPlease, try again later',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0,
                      ),
                    );
                  }

                  return const Column(
                    children: <Widget>[
                      Expanded(child: SwiperCardList()),
                      BottomActionsRow(),
                    ],
                  );
                },
              ),
        ),
      ),
    );
  }
}
