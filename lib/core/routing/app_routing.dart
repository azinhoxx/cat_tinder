import 'package:cat_tinder/features/cat_profiles/presentation/screens/details_screen.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/screens/image_fullscreen.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/details',
      builder: (context, state) => const DetailsScreen(),
    ),
    GoRoute(
      path: '/fullscreen',
      builder: (context, state) => const ImageFullScreen(),
    ),
  ],
);
