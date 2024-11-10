// Dependencies
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/movie/app/screens/movie_detail/movie_detail_buttons.dart';

// Provider
import 'package:moviedb/movie/domain/provider/movie_provider.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  MovieDetailScreenState createState() => MovieDetailScreenState();
}

class MovieDetailScreenState extends ConsumerState<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();
    final movieSelected = ref.read( movieSelectedProvider )!;
    ref.read(movieDetailProvider.notifier).detail(id: movieSelected.id);
  }

  @override
  void deactivate() {
    ref.invalidate(movieSelectedProvider);
    ref.invalidate(movieDetailProvider);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final movie = ref.watch( movieDetailProvider );
    final movieSelected = ref.read( movieSelectedProvider )!;

    return Scaffold(
      appBar: AppBar(
        title: Text(movieSelected.title),
      ),
      body: (movie == null) ? const SizedBox() : ListView( 
        children: [
          Stack(
            children: [
              Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(movie.posterImage),
                    fit: BoxFit.cover,
                  ),
                  
                ),
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black,
                      ],
                      stops: [0.8, 1.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  )
                ),
              ),

              const SharedButtonMovieDetail(),

              LikeButtonMovieDetail(
                movie: movie,
              ),
            ],
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(movie.title),
                  subtitle: Column(
                    children: [
                      movie.tagLine.isEmpty ? const SizedBox() : Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          movie.tagLine,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(DateFormat.yMMMMEEEEd('es_MX').format(movie.releaseDate)),
                      ),
                      movie.overview.isEmpty ? const SizedBox() : const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Descripción:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ), 
                      Text(
                        movie.overview,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  // subtitle: Text(movie.overview),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ...movie.genres.map((genre) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: FilledButton(
                          onPressed: () {}, 
                          child: Text(genre.name,
                        )),
                      ) )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
