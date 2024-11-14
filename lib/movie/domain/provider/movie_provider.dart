// Dependencies
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Model
import 'package:moviedb/movie/domain/model/movie.dart';
import 'package:moviedb/movie/domain/model/movie_response.dart';

// DataSource
import 'package:moviedb/movie/infrastructure/movie_datasource.dart';

// Services
import 'package:moviedb/shared/services/loading-service/loading_service.dart';
import 'package:moviedb/shared/services/preferences-service/shared_preferences_service.dart';
import 'package:moviedb/shared/services/snackbar-service/snackbar_service.dart';


final moviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>?>((ref) => MoviesNotifier());

final movieIdProvider = StateProvider<int?>(
  (ref) => null,
);

class MoviesNotifier extends StateNotifier<List<Movie>?> {
  MoviesNotifier(): super(null);

  final movieDataSource = MovieDataSource();
  int page = 1;
  int pageSearch = 1;
  
  Future<void> search({ String ? movieQuery, required BuildContext context }) async {
    if (movieQuery == null) {
      state?.clear();
      return;
    }

    final loadingService = LoadingService();

    await movieDataSource.searchMovie(
      movieQuery: movieQuery, 
      page: pageSearch,
      success: (response) {
        final movies = response.results;
        state = movies;
      },
      finishLoading: () => loadingService.finishLoading(context),
      loading: () => loadingService.showLoading(context),
      failure: (error) => SnackbarService(
        context: context,
        textContent: error.message
      ).showErrorSnackBar(error.code),
    );
  }

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

  Future<void> detailMovie({ 
    required int id,
    required BuildContext context,
    void Function() ? loading,
    void Function() ? finishLoading,
  }) async {
    final movies = state;
    final movieWhere = movies!.where((e) => e.id == id).first;
    final index = movies.indexOf(movieWhere);

    final loadingService = LoadingService();
    await movieDataSource.detailMovie(
      id: id,
      finishLoading: () => loadingService.finishLoading(context),
      loading: () => loadingService.showLoading(context),
      success: (response) {
        movies[index] = response;
        state = [...movies];
      },
      failure: (error) => SnackbarService(
        context: context,
        textContent: error.message
      ).showErrorSnackBar(error.code),
    );
  }

  Future<void> nowPlaying({
    void Function(MovieDbResponse response)? success,    
    required BuildContext context,
  }) async {
    final loadingService = LoadingService();

    await movieDataSource.nowPlaying(
      page: page,
      finishLoading: () => loadingService.finishLoading(context),
      loading: () => loadingService.showLoading(context),
      success: (response) {
        page++;
        final movies = response.results;
        state = [...?state, ...movies];
        if (state!.length < 50) nowPlaying(context: context);
      },
      failure: (error) => SnackbarService(
        context: context,
        textContent: error.message
      ).showErrorSnackBar(error.code),
    );
  }
}
