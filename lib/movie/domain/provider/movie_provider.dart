// Dependencies
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Model
import 'package:moviedb/movie/domain/model/movie.dart';
import 'package:moviedb/movie/domain/model/movie_response.dart';

// DataSource
import 'package:moviedb/movie/infrastructure/movie_datasource.dart';


final moviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>?>((ref) => MoviesNotifier());

final movieDetailProvider = StateNotifierProvider<DetailMovieNotifier, MovieDetail?>((ref) => DetailMovieNotifier());


final movieSelectedProvider = StateProvider<Movie?>(
  (ref) => null,
);

class DetailMovieNotifier extends StateNotifier<MovieDetail?> {
  DetailMovieNotifier(): super(null);

  final movieDataSource = MovieDataSource();


  Future<void> detail({required int id}) async {
    await movieDataSource.detailMovie(
      id: id,
      success: (response) => state = response,
    );
  }
}

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
