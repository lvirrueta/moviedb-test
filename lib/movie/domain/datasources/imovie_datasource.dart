
import 'package:moviedb/movie/domain/model/movie.dart';
import 'package:moviedb/movie/domain/model/movie_response.dart';
import 'package:moviedb/shared/services/http-service/error_http_model.dart';

abstract class IMovieDataSource {
  /// get the user's nomina by date
  Future<void> nowPlaying({
    required int page,
    void Function(MovieDbResponse response) ? success,
    void Function() ? loading,
    void Function() ? finishLoading,
    void Function(ErrorHttp error) ? failure,
  });

  Future<void> detailMovie({
    required int id,
    void Function() ? loading,
    void Function() ? finishLoading,
    void Function(Movie response) ? success,
    void Function(ErrorHttp error) ? failure,
  });

  Future<void> searchMovie({
    required String movieQuery,
    required int page,
    void Function(MovieDbResponse response) ? success,
    void Function(ErrorHttp error) ? failure,
  });
}
