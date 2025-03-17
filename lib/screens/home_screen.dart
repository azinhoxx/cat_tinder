import 'package:flutter/material.dart';
import 'package:cat_tinder/models/error_model.dart';
import 'package:cat_tinder/utilities/utils.dart';
import 'package:cat_tinder/widgets/base/cat_scaffold.dart';
import 'package:cat_tinder/widgets/base/error_message_widget.dart';
import 'package:cat_tinder/widgets/base/paw_loading_indicator.dart';
import 'package:cat_tinder/widgets/home_screen/bottom_actions_row.dart';
import 'package:cat_tinder/providers/swiper_provider.dart';
import 'package:cat_tinder/widgets/home_screen/swiper_card_list.dart';
import 'package:provider/provider.dart' show Selector, Provider;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateErrorScreen(
    BuildContext context,
    CustomError error,
    VoidCallback onPressed,
  ) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushNamed(
        context,
        '/error',
        arguments: {
          'message': error.type.message,
          'buttonText': 'TRY AGAIN',
          'onPressed': onPressed,
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CatScaffold(
      body: Selector<
        SwiperProvider,
        ({bool isLoading, bool isFirstLoading, CustomError? error})
      >(
        selector:
            (context, provider) => (
              isLoading: provider.isLoading,
              isFirstLoading: provider.isFirstLoading,
              error: provider.error,
            ),
        builder: (context, value, child) {
          final error = value.error;

          final onPressed =
              Provider.of<SwiperProvider>(context, listen: false).handleError;

          if (value.isFirstLoading && AppUtils.isSplashSupportedPlatform) {
            return const SizedBox.shrink();
          }

          if (error != null && error.slidesCount == 0) {
            return ErrorMessageWidget(
              message: error.type.message,
              onPressed: () => onPressed(force: true),
              buttonText: 'TRY AGAIN',
            );
          }

          if (error != null) {
            _navigateErrorScreen(context, error, onPressed);
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
