// Models
import 'package:moviedb/movie/domain/model/movie.dart';
import 'package:moviedb/movie/domain/model/movie_response.dart';
import 'package:moviedb/shared/services/http-service/error_http_model.dart';

// Services
import 'package:moviedb/shared/services/http-service/http_service.dart';
import 'package:moviedb/shared/services/preferences-service/shared_preferences_service.dart';

// Interfaces
import 'package:moviedb/movie/domain/datasources/imovie_datasource.dart';

// Constants
import 'package:moviedb/shared/constants/api_routes_constants.dart';
import 'package:moviedb/shared/services/http-service/http_method_enum.dart';


class MovieDataSource implements IMovieDataSource {
  final httpService = HttpService();
  final language = 'es-MX';

  @override
  Future<void> nowPlaying({
    required int page,
    void Function() ? loading,
    void Function() ? finishLoading,
    void Function(ErrorHttp error) ? failure,
    void Function(MovieDbResponse response)? success
  }) async {
    await httpService.http(
      url: ApiRoutes.nowPlaying, 
      method: HttpMethodEnum.get,
      queryParameters: { 
        'page': page,
        'language': language,
      },
      loading: loading,
      finishLoading: finishLoading,
      success: (r) async {
        final MovieDbResponse moviesApi = MovieDbResponse.fromJson(r.data);
        final moviesLiked = await SharedPreferencesService().getMoviesLiked();
        final movies = MovieDbResponse(
          page: moviesApi.page,
          totalPages: moviesApi.totalPages,
          totalResults: moviesApi.totalResults,
          results: moviesApi.results.map((e) {
            e.isLiked = (moviesLiked.where((m) => m.id == e.id).isNotEmpty);
            return e;
          }).toList(),
        );
        success?.call(movies);
      },
      failure: failure
    );
  }
  
  @override
  Future<void> detailMovie({
    required int id,
    void Function() ? loading,
    void Function() ? finishLoading,
    void Function(Movie response)? success,
    void Function(ErrorHttp error) ? failure,
  }) async {
    await httpService.http(
      url: '${ApiRoutes.detail}$id', 
      method: HttpMethodEnum.get,
      loading: loading,
      finishLoading: finishLoading,
      failure: failure,
      queryParameters: { 
        'language': language,
      },
      success: (r) async {
        final Movie movieApi = Movie.fromJson(r.data);
        final moviesLiked = await SharedPreferencesService().getMoviesLiked();
        movieApi.isLiked = moviesLiked.where((m) => m.id == movieApi.id).isNotEmpty;
        success?.call(movieApi);
      } 
    );
  }
  
  @override
  Future<void> searchMovie({
    required String movieQuery,
    required int page,
    void Function(MovieDbResponse response)? success,
    void Function(ErrorHttp error) ? failure,
    void Function() ? loading,
    void Function() ? finishLoading,
  }) async {
    if (movieQuery.length <= 3) return;
    await httpService.http(
      url: ApiRoutes.search, 
      method: HttpMethodEnum.get,
      queryParameters: { 
        'page': page,
        'language': language,
        'query': movieQuery,
      },
      loading: loading,
      finishLoading: finishLoading,
      failure: failure,
      success: (r) async {
        final MovieDbResponse moviesApi = MovieDbResponse.fromJson(r.data);
        final moviesLiked = await SharedPreferencesService().getMoviesLiked();
        final movies = MovieDbResponse(
          page: moviesApi.page,
          totalPages: moviesApi.totalPages,
          totalResults: moviesApi.totalResults,
          results: moviesApi.results.map((e) {
            e.isLiked = (moviesLiked.where((m) => m.id == e.id).isNotEmpty);
            return e;
          }).toList(),
        );
        success?.call(movies);
      },
    );
  }
}