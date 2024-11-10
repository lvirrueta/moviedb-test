import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moviedb/config/router/routes.dart';
import 'package:moviedb/movie/domain/provider/movie_provider.dart';

class NowPlayingMoviesScreen extends ConsumerStatefulWidget {
  const NowPlayingMoviesScreen({super.key});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<NowPlayingMoviesScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(moviesProvider.notifier).nowPlaying();
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(moviesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartelera'),
      ),
      body: (movies == null) 
        ? const Center(child: Text('Cargando')) 
        : ListView(
          children: [
            ...movies.map((movie) => ListTile(
              title: Text(movie.title),
              trailing: const Icon(Icons.arrow_forward),
              leading: const Icon(Icons.movie),
              onTap: () {
                ref.read(movieSelectedProvider.notifier).state = movie;
                context.push(Routes.detailMovie);
              },
            )),

            ListTile(
              title: const Text('Más películas...'),
              leading: const Icon(Icons.movie),
              trailing: const Icon(Icons.keyboard_double_arrow_down),
              onTap: () => ref.read(moviesProvider.notifier).nowPlaying(),
            )
          ],
        )
    );
  }
}
