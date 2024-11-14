
import 'dart:convert';

import 'package:moviedb/movie/domain/model/movie.dart';
import 'package:moviedb/shared/services/preferences-service/ishared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService implements ISharedPreferencesService {
  @override
  Future<List<Movie>> getMoviesLiked() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> ? moviesString = prefs.getStringList('moviesFavorites');
    final List<Movie> movies = List.empty(growable: true);

    moviesString?.forEach((e) {
      final movieLiked = Movie.fromJson(jsonDecode(e));
      movies.add(movieLiked);
    });
    return movies;
  }
  
  @override
  Future<void> toggleMoviesLiked({required Movie movie}) async {
    final moviesLiked = await getMoviesLiked();

    if (moviesLiked.where((m) => m.id == movie.id).isNotEmpty) {
      moviesLiked.removeWhere((m) => m.id == movie.id);
    } else {
      moviesLiked.add(movie);
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'moviesFavorites', 
      moviesLiked.map((e) => jsonEncode(e.toJson())).toList(),
    );
  }

  

}