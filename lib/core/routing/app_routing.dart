import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/screens/details_screen.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/screens/image_fullscreen.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/details',
      builder: (BuildContext context, GoRouterState state) {
        final CatEntity cat = state.extra as CatEntity;
        return DetailsScreen(cat: cat);
      },
    ),
    GoRoute(
      path: '/fullscreen',
      builder: (BuildContext context, GoRouterState state) {
        final String url = state.extra as String;
        return ImageFullScreen(url: url);
      },
    ),
  ],
);
