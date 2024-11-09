// Dependencies
import 'package:go_router/go_router.dart';
import 'package:moviedb/landing/application/landing_screen.dart';

// Screens
import 'package:moviedb/movie/app/screens/now_playing_screen.dart';

// Constants
import 'package:moviedb/config/router/routes.dart';


final appRouter = GoRouter(
  initialLocation: Routes.root,
  routes: [
    GoRoute(path: Routes.root, builder: (context, state) => const LandingScreen() ),
    GoRoute(path: Routes.nowPlaying, builder: (context, state) => const MovieScreen() ),
  ]
);
