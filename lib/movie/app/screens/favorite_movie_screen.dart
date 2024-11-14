// Dependencies
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Constants
import 'package:moviedb/config/router/routes.dart';

// Providers
import 'package:moviedb/movie/domain/provider/movie_provider.dart';


class FavoriteMovieScreen extends ConsumerStatefulWidget {
  const FavoriteMovieScreen({ super.key });

  @override
  FavoriteMovieScreenState createState() => FavoriteMovieScreenState();
}

class FavoriteMovieScreenState extends ConsumerState<FavoriteMovieScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(moviesProvider.notifier).getFavorites();
  }

  @override
  void deactivate() {
    ref.invalidate(moviesProvider);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(moviesProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: (movies == null) ? const SizedBox() : ListView(
        children: [
          ...movies.map((movie) => !movie.isLiked ? const SizedBox() :ListTile(
            title: Text(movie.title),
            onTap: () {
              ref.read(movieIdProvider.notifier).state = movie.id;
              context.push(Routes.detailMovie);
            },
          )),

        ],
      )
    );
  }
}
