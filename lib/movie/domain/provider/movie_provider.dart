// Dependencies
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Model
import 'package:moviedb/movie/domain/model/movie.dart';
import 'package:moviedb/movie/domain/model/movie_response.dart';

// DataSource
import 'package:moviedb/movie/infrastructure/movie_datasource.dart';


final moviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>?>((ref) => MoviesNotifier());

final movieSelectedProvider = StateProvider<Movie>(
  (ref) => Movie(id: 0, title: '', overview: ''),
);

class MoviesNotifier extends StateNotifier<List<Movie>?> {
  MoviesNotifier(): super(null);

  final movieDataSource = MovieDataSource();
  int page = 1;
  
  Future<void> nowPlaying({
    void Function(MovieDbResponse response)? success,
  }) async {
    await movieDataSource.nowPlaying(
      page: page,
      success: (response) {
        page++;
        final movies = response.results;
        state = [...?state, ...movies];
        if (state!.length < 50) nowPlaying();
      },
    );
  }
}
