import 'package:animations/animations.dart';
import 'package:cat_tinder/core/base_components/app_page.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/screens/details_screen.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/screens/home_screen.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/screens/image_fullscreen.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/screens/liked_cats_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/details',
      pageBuilder: (context, state) {
        final CatEntity cat = state.extra as CatEntity;
        return AppPage(child: DetailsScreen(cat: cat));
      },
    ),
    GoRoute(
      path: '/fullscreen',
      pageBuilder: (context, state) {
        final String url = state.extra as String;
        return AppPage(
          type: SharedAxisTransitionType.scaled,
          child: ImageFullScreen(url: url),
        );
      },
    ),
    GoRoute(
      path: '/likes',
      pageBuilder: (context, state) => AppPage(child: const LikedCatsScreen()),
    ),
  ],
);
