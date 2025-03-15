import 'package:flutter/material.dart';
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
    ErrorMessage error,
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
        child: Selector<
          SwiperProvider,
          ({bool isLoading, ErrorMessage? errorMessage})
        >(
          selector:
              (context, provider) => (
                isLoading: provider.isLoading,
                errorMessage: provider.errorMessage,
              ),
          builder: (context, value, child) {
            final errorMessage = value.errorMessage;

            final onPressed =
                Provider.of<SwiperProvider>(
                  context,
                  listen: false,
                ).recoverFromError;

            if (errorMessage != null && errorMessage.slidesCount == 0) {
              return ErrorMessageWidget(
                message: errorMessage.type.message,
                buttonText: 'TRY AGAIN',
                onPressed: () => onPressed(force: true),
              );
            }

            if (errorMessage != null) {
              _navigateErrorScreen(context, errorMessage, onPressed);
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
