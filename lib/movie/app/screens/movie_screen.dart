// Dependencies
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider
import 'package:moviedb/movie/domain/provider/movie_provider.dart';


class MovieScreen extends ConsumerWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movie = ref.watch( movieSelectedProvider )!;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: ListView(
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
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
