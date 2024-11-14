
class Movie {
  final int id;
  final String title;
  final String overview;
  final String _backdropPath;
  final String _posterPath;
  final double voteAverage;
  final DateTime ? releaseDate;
  final int voteCount;
  final double popularity;
  bool isLiked;
  final String tagLine;
  final List<Genres> genres;

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
    required this.tagLine,
    required this.genres,
  }) : 
      _posterPath = posterPath, 
      _backdropPath = backdropPath;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    backdropPath: json["backdrop_path"] ?? '',
    id: json["id"],
    overview: json["overview"] ?? '',
    posterPath: json["poster_path"] ?? '',
    releaseDate: json["release_date"].toString().isNotEmpty ? DateTime.parse(json["release_date"]) : null,
    title: json["title"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
    popularity: json["popularity"]?.toDouble(),
    isLiked: true,
    tagLine: json["tagline"] ?? '',
    genres: json["genres"] != null ? List<Map<String, dynamic>>.from(json['genres']).map((e) => Genres.fromJson(e)).toList() : List.empty(),
  );

  String get posterImage => 'https://image.tmdb.org/t/p/w780$_posterPath';
  String get backdropImage => 'https://image.tmdb.org/t/p/w780$_backdropPath';

  Map toJson() => {
    'backdrop_path': _backdropPath,
    'id': id,
    'overview': overview,
    'poster_path': _posterPath,
    'release_date': releaseDate?.toIso8601String(),
    'title': title,
    'vote_average': voteAverage,
    'vote_count': voteCount,
    'popularity': popularity,
    'isLiked': isLiked,
    'tagline': tagLine,
  };
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
