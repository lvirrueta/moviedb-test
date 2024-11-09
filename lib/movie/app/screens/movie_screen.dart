import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/movie/domain/provider/movie_provider.dart';

class MovieScreen extends ConsumerStatefulWidget {
  const MovieScreen({super.key});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
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
        : ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(
              title: Text(movie.title),
            );
          },
      )
    );
  }
}
