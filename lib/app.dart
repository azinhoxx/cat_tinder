import 'package:cat_tinder/core/di/app_component/app_component.dart';
import 'package:cat_tinder/core/utils/helpers/theme_helper/app_theme_helper.dart';
import 'package:cat_tinder/core/utils/routing/app_routing.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit/home_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_cubit.dart';
import 'package:cat_tinder/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatTinderApp extends StatelessWidget {
  const CatTinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<HomeCubit>()..fetchSlides()),
        BlocProvider(
          create: (context) => locator<LikedCatsCubit>()..loadCats(),
        ),
      ],
      child: MaterialApp.router(
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        title: 'CatTinder',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: AppTheme.theme(),
      ),
    );
  }
}
