class MovieSharedPreference {
  final int id;
  final String name; 

  MovieSharedPreference({
    required this.id,
    required this.name,
  });

  Map toJson() => {
    'id': id,
    'name': name,
  };

  factory MovieSharedPreference.fromJson(Map<String, dynamic> json) => MovieSharedPreference(
    id: json["id"],
    name: json["name"],
  );

}

class Movie {
  final int id;
  final String title;
  final String overview;
  final String _backdropPath;
  final String _posterPath;
  final double voteAverage;
  final DateTime releaseDate;
  final int voteCount;
  final double popularity;
  bool isLiked;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required String backdropPath,
    required this.voteAverage,
    required String posterPath,
    required this.releaseDate,
    required this.voteCount,
    required this.popularity,
    required this.isLiked,
  }) : 
      _posterPath = posterPath, 
      _backdropPath = backdropPath;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    backdropPath: json["backdrop_path"] ?? '',
    id: json["id"],
    overview: json["overview"] ?? '',
    posterPath: json["poster_path"] ?? '',
    releaseDate: DateTime.parse(json["release_date"]),
    title: json["title"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
    popularity: json["popularity"]?.toDouble(),
    isLiked: true,
  );

  String get posterImage => 'https://image.tmdb.org/t/p/w780$_posterPath';
  String get backdropImage => 'https://image.tmdb.org/t/p/w780$_backdropPath';
}

class MovieDetail extends Movie {
  final String tagLine;
  final List<Genres> genres;

  MovieDetail({
    required super.id,
    required super.title,
    required super.overview,
    required super.backdropPath,
    required super.posterPath,
    required super.voteAverage,
    required super.releaseDate,
    required super.voteCount,
    required super.popularity,
    required super.isLiked,
    required this.tagLine,
    required this.genres,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    final movie = Movie.fromJson(json);
    return MovieDetail(
      id: movie.id, 
      title: movie.title, 
      overview: movie.overview, 
      backdropPath: movie._posterPath, 
      posterPath: movie._posterPath, 
      voteAverage: movie.voteAverage, 
      releaseDate: movie.releaseDate,
      voteCount: movie.voteCount,
      popularity: movie.popularity,
      isLiked: movie.isLiked,
      tagLine: json["tagline"] ?? '',
      genres: List<Map<String, dynamic>>.from(json['genres']).map((e) => Genres.fromJson(e)).toList(),
    );
  }
}

class Genres {
  final int id;
  final String name;

  const Genres({
    required this.id,
    required this.name,
  });

  factory Genres.fromJson(Map<String, dynamic> json) => Genres(
    id: json["id"],
    name: json["name"],
  );
}
