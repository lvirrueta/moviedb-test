// Models
import 'package:moviedb/movie/domain/model/movie.dart';
import 'package:moviedb/movie/domain/model/movie_response.dart';

// Services
import 'package:moviedb/shared/services/http-service/http_service.dart';

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
    void Function(MovieDbResponse response)? success
  }) async {
    await httpService.http(
      url: ApiRoutes.nowPlaying, 
      method: HttpMethodEnum.get,
      queryParameters: { 
        'page': page,
        'language': language,
      },
      success: (r) => success?.call(MovieDbResponse.fromJson(r.data)),
    );
  }
  
  @override
  Future<void> detailMovie({
    required int id,
    void Function(MovieDetail response)? success
  }) async {
    await httpService.http(
      url: '${ApiRoutes.detail}$id', 
      method: HttpMethodEnum.get,
      queryParameters: { 
        'language': language,
      },
      success: (r) => success?.call(MovieDetail.fromJson(r.data)),
    );
  }
}