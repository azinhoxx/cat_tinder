import 'package:flutter/material.dart';
import 'package:cat_tinder/features/cat_profiles/utils/utils.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/base/cat_scaffold.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/base/paw_loading_indicator.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/bottom_actions_row.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/providers/swiper_provider.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/swiper_card_list.dart';
import 'package:provider/provider.dart' show Selector;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CatScaffold(
      body: Selector<SwiperProvider, ({bool isLoading, bool isFirstLoading})>(
        selector:
            (context, provider) => (
              isLoading: provider.isLoading,
              isFirstLoading: provider.isFirstLoading,
            ),
        builder: (context, value, child) {
          if (value.isFirstLoading && AppUtils.isSplashSupportedPlatform) {
            return const SizedBox.shrink();
          }

          if (value.isLoading) {
            return const PawLoadingIndicator();
          }

          return Column(
            children: <Widget>[
              Expanded(child: const SwiperCardList()),
              if (child != null) child,
            ],
          );
        },

        child: const BottomActionsRow(),
      ),
    );
  }
}
