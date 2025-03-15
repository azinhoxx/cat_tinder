import 'package:flutter/material.dart';
import 'package:flutter_hw_1/models/error_model.dart';
import 'package:flutter_hw_1/widgets/base/cat_scaffold.dart';
import 'package:flutter_hw_1/widgets/base/error_message_widget.dart';
import 'package:flutter_hw_1/widgets/base/paw_loading_indicator.dart';
import 'package:flutter_hw_1/widgets/home_screen/bottom_actions_row.dart';
import 'package:flutter_hw_1/providers/swiper_provider.dart';
import 'package:flutter_hw_1/widgets/home_screen/swiper_card_list.dart';
import 'package:provider/provider.dart';

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
      body: ChangeNotifierProvider(
        create: (context) => SwiperProvider(),
        child: Selector<SwiperProvider, ({bool isLoading, CustomError? error})>(
          selector:
              (context, provider) => (
                isLoading: provider.isLoading,
                error: provider.error,
              ),
          builder: (context, value, child) {
            final error = value.error;

            final onPressed =
                Provider.of<SwiperProvider>(
                  context,
                  listen: false,
                ).recoverFromError;

            if (error != null && error.slidesCount == 0) {
              return ErrorMessageWidget(
                message: error.type.message,
                buttonText: 'TRY AGAIN',
                onPressed: () => onPressed(force: true),
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
      ),
    );
  }
}
