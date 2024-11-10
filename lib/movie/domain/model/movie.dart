class Movie {
  final int id;
  final String title;
  final String overview;
  final String _backdropPath;
  final String _posterPath;
  final double voteAverage;
  final DateTime releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required String backdropPath,
    required this.voteAverage,
    required String posterPath,
    required this.releaseDate,
  }) : 
      _posterPath = posterPath, 
      _backdropPath = backdropPath;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    // adult: json["adult"] ?? false,
    backdropPath: json["backdrop_path"] ?? '',
    // genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    // originalLanguage: json["original_language"],
    // originalTitle: json["original_title"],
    overview: json["overview"] ?? '',
    // popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"] ?? '',
    releaseDate: DateTime.parse(json["release_date"]),
    title: json["title"],
    // video: json["video"],
    voteAverage: json["vote_average"]?.toDouble(),
    // voteCount: json["vote_count"],
  );

  String get posterImage => 'https://image.tmdb.org/t/p/w780$_posterPath';
  String get backdropImage => 'https://image.tmdb.org/t/p/w780$_backdropPath';
}