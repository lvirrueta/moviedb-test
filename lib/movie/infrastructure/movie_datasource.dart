import 'package:moviedb/movie/domain/datasources/imovie_datasource.dart';
import 'package:moviedb/movie/domain/model/movie_response.dart';
import 'package:moviedb/shared/constants/api_routes_constants.dart';
import 'package:moviedb/shared/services/http-service/http_method_enum.dart';
import 'package:moviedb/shared/services/http-service/http_service.dart';

class MovieDataSource implements IMovieDataSource {
  final httpService = HttpService();

  @override
  Future<void> nowPlaying({
    void Function(MovieDbResponse response)? success
  }) async {
    await httpService.http(
      url: ApiRoutes.nowPlaying, 
      method: HttpMethodEnum.get,
      success: (r) => success?.call(MovieDbResponse.fromJson(r.data)),
    );
  }
}