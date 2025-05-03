import 'package:cat_tinder/core/common_domain/entities/based_api_result/error_result_model.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_state.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/base/paw_loading_indicator.dart';
import 'package:cat_tinder/core/utils/constants/is_splash_supported.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit/home_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit/home_state.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/screen_empty_state.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/screen_error_state.dart';
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
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen:
            (previous, current) =>
                previous.isFirstLoading != current.isFirstLoading ||
                current.isEmpty != previous.isEmpty,
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

                if (homeState.isEmpty) {
                  if (homeState.error?.type == ErrorType.networkError) {
                    return const ScreenErrorState(
                      message:
                          'No network connection\nLiked cats are still available 😻',
                    );
                  }
                  if (homeState.error?.type == ErrorType.unknownError) {
                    return const ScreenErrorState(
                      message:
                          'Something went wrong\nLiked cats are still available 😻',
                    );
                  }
                  return const ScreenEmptyState();
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
    );
  }
}
