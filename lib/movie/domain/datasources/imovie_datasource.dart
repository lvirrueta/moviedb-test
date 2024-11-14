
import 'package:moviedb/movie/domain/model/movie.dart';
import 'package:moviedb/movie/domain/model/movie_response.dart';

abstract class IMovieDataSource {
  /// get the user's nomina by date
  Future<void> nowPlaying({
    required int page,
    void Function(MovieDbResponse response) ? success,
    void Function() ? loading,
    void Function() ? finishLoading,
  });

  Future<void> detailMovie({
    required int id,
    void Function() ? loading,
    void Function() ? finishLoading,
    void Function(Movie response) ? success,
  });

  Future<void> searchMovie({
    required String movieQuery,
    required int page,
    void Function(MovieDbResponse response) ? success,
  });
}
