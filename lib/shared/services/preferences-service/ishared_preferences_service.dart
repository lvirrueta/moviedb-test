import 'package:moviedb/movie/domain/model/movie.dart';

abstract class ISharedPreferencesService {
  Future<List<Movie>> getMoviesLiked ();
  Future<void> toggleMoviesLiked ({ required Movie movie });
}
