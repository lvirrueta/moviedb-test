// Dependencies
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Model
import 'package:moviedb/movie/domain/model/movie.dart';
import 'package:moviedb/movie/domain/model/movie_response.dart';

// IDataSource
import 'package:moviedb/movie/domain/datasources/imovie_datasource.dart';

// DataSource
import 'package:moviedb/movie/infrastructure/movie_datasource.dart';


final moviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>?>((ref) => MoviesNotifier());

class MoviesNotifier extends StateNotifier<List<Movie>?> implements IMovieDataSource {
  MoviesNotifier(): super(null);

  final movieDataSource = MovieDataSource();
  
  @override
  Future<void> nowPlaying({
    void Function(MovieDbResponse response)? success
  }) async {
    await movieDataSource.nowPlaying(
      success: (r) => state = r.results,
    );
  }
}
