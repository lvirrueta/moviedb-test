import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/movie/domain/model/movie.dart';
import 'package:moviedb/movie/domain/provider/movie_provider.dart';

class LikeButtonMovieDetail extends ConsumerStatefulWidget {
  final Movie movie;

  const LikeButtonMovieDetail({
    super.key,
    required this.movie,
  });

  @override
  LikedButtonMovieState createState() => LikedButtonMovieState();
}

class LikedButtonMovieState extends ConsumerState<LikeButtonMovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 0,
      child: IconButton(
        onPressed: () => ref.read(moviesProvider.notifier).toggleFavoriteMovie(id: widget.movie.id),
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
