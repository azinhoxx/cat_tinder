import 'package:flutter/material.dart';
import 'package:flutter_hw_1/widgets/base/cat_app_bar.dart';
import 'package:flutter_hw_1/widgets/base/cat_scaffold.dart';
import 'package:flutter_hw_1/widgets/base/error_message.dart';
import 'package:flutter_hw_1/widgets/base/paw_loading_indicator.dart';
import 'package:flutter_hw_1/widgets/home_screen/bottom_actions_row.dart';
import 'package:flutter_hw_1/providers/swiper_provider.dart';
import 'package:flutter_hw_1/widgets/home_screen/swiper_card_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CatScaffold(
      appBar: const CatAppBar(),
      body: ChangeNotifierProvider(
        create: (context) => SwiperProvider(),
        child:
            Selector<SwiperProvider, ({bool isLoading, String? errorMessage})>(
              selector:
                  (context, provider) => (
                    isLoading: provider.isLoading,
                    errorMessage: provider.errorMessage,
                  ),
              builder: (context, value, child) {
                if (value.errorMessage != null) {
                  return ErrorMessage(
                    message: value.errorMessage!,
                    buttonText: 'TRY AGAIN',
                    onPressed:
                        Provider.of<SwiperProvider>(
                          context,
                          listen: false,
                        ).recoverFromError,
                  );
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
