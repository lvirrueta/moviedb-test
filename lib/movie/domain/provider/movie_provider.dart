// Dependencies
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Model
import 'package:moviedb/movie/domain/model/movie.dart';
import 'package:moviedb/movie/domain/model/movie_response.dart';

// DataSource
import 'package:moviedb/movie/infrastructure/movie_datasource.dart';

// Services
import 'package:moviedb/shared/services/preferences-service/shared_preferences_service.dart';


final moviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>?>((ref) => MoviesNotifier());

final movieIdProvider = StateProvider<int?>(
  (ref) => null,
);

class MoviesNotifier extends StateNotifier<List<Movie>?> {
  MoviesNotifier(): super(null);

  final movieDataSource = MovieDataSource();
  int page = 1;
  
  Future<void> getFavorites() async {
    final movies = await SharedPreferencesService().getMoviesLiked();
    state = movies;
  }

  void toggleFavoriteMovie({ required id }) {
    final movies = state;
    final movieWhere = movies!.where((e) => e.id == id).first;
    final index = movies.indexOf(movieWhere);
    movies[index].isLiked = !movies[index].isLiked;
    state = [...movies];

    SharedPreferencesService().toggleMoviesLiked(
      movie: movies[index],
    );
  }

  Future<void> detailMovie({ required int id }) async {
    final movies = state;
    final movieWhere = movies!.where((e) => e.id == id).first;
    final index = movies.indexOf(movieWhere);
    await movieDataSource.detailMovie(
      id: id,
      success: (response) {
        movies[index] = response;
        state = [...movies];
      } 
    );
  }

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
