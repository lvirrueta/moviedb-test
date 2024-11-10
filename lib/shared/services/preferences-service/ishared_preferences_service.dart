import 'package:moviedb/movie/domain/model/movie.dart';

abstract class ISharedPreferencesService {
  Future<List<MovieSharedPreference>> getMoviesLiked ();
  Future<void> toggleMoviesLiked ({ required MovieSharedPreference movie });
}
