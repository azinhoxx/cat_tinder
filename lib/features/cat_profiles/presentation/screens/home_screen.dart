import 'package:cat_tinder/core/di/app_component/app_component.dart';
import 'package:cat_tinder/core/utils/constants/is_splash_supported.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_state.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/base/paw_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/base/cat_scaffold.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/bottom_actions_row.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/swiper_card_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<HomeCubit>()..fetchSlides(),
      child: CatScaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.isFirstLoading && isSplashSupportedPlatform) {
              return const SizedBox.shrink();
            }

            if (state.isLoading) {
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
      ),
    );
  }
}
