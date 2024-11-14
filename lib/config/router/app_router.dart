// Dependencies
import 'package:go_router/go_router.dart';

// Screens
import 'package:moviedb/landing/application/landing_screen.dart';
import 'package:moviedb/movie/app/screens/now_playing_screen.dart';
import 'package:moviedb/movie/app/screens/search_movie_screen.dart';
import 'package:moviedb/movie/app/screens/favorite_movie_screen.dart';
import 'package:moviedb/movie/app/screens/movie_detail_screen.dart';

// Constants
import 'package:moviedb/config/router/routes.dart';


final appRouter = GoRouter(
  initialLocation: Routes.root,
  routes: [
    GoRoute(path: Routes.root, builder: (context, state) => const LandingScreen() ),
    GoRoute(path: Routes.nowPlaying, builder: (context, state) => const NowPlayingMoviesScreen() ),
    GoRoute(path: Routes.detailMovie, builder: (context, state) => const MovieDetailScreen() ),
    GoRoute(path: Routes.favorites, builder: (context, state) => const FavoriteMovieScreen() ),
    GoRoute(path: Routes.search, builder: (context, state) => const SearchMovieScreen() ),
  ]
);
