// Dependencies
import 'package:go_router/go_router.dart';

// Screens
import 'package:moviedb/landing/application/landing_screen.dart';

// Constants
import 'package:moviedb/config/router/routes.dart';


final appRouter = GoRouter(
  initialLocation: Routes.root,
  routes: [
    GoRoute(path: Routes.root, builder: (context, state) => const LandingScreen() ),
  ]
);
