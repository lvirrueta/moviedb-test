// Dependencies
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          Container(
            height: 600,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(movie.posterImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(movie.title),
                  subtitle: Text(movie.overview),
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
