import 'package:flutter/material.dart';
import 'package:moviedb/movie/domain/model/movie.dart';
import 'package:moviedb/shared/services/preferences-service/shared_preferences_service.dart';

class LikeButtonMovieDetail extends StatefulWidget {
  final Movie movie;

  const LikeButtonMovieDetail({
    super.key,
    required this.movie,
  });

  @override
  State<LikeButtonMovieDetail> createState() => _LikeButtonMovieDetailState();
}

class _LikeButtonMovieDetailState extends State<LikeButtonMovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 0,
      child: IconButton(
        onPressed: () {
          SharedPreferencesService().toggleMoviesLiked(
            movie: MovieSharedPreference(
              id: widget.movie.id, 
              name: widget.movie.title,
            ),
          );
          widget.movie.isLiked = !widget.movie.isLiked;
          setState(() {});
        },
        icon: Icon(
          Icons.favorite,
          color: widget.movie.isLiked ? Colors.red : Colors.white,
        ),
      ),
    );
  }
}

class SharedButtonMovieDetail extends StatelessWidget {
  const SharedButtonMovieDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 80,
      right: 0,
      child: IconButton(
        onPressed: () {}, 
        icon: const Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
    );
  }
}
