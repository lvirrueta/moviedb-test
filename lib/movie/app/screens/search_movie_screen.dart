// Dependencies
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider
import 'package:moviedb/movie/domain/provider/movie_provider.dart';

// Constants
import 'package:moviedb/config/router/routes.dart';


class SearchMovieScreen extends ConsumerStatefulWidget {
  const SearchMovieScreen({super.key});

  @override
  SearchMovieScreenState createState() => SearchMovieScreenState();
}

class SearchMovieScreenState extends ConsumerState<SearchMovieScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(moviesProvider.notifier).search();
  }
  
  @override
  void deactivate() {
    ref.invalidate(moviesProvider);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(moviesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca'),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            onChanged: (value) =>  ref.read(moviesProvider.notifier).search(movieQuery: value),
          ),
          Flexible(
            child: ListView(
              children: [
                ...?movies?.map((movie) => ListTile(
                  title: Text(movie.title),
                  onTap: () {
                    ref.read(movieIdProvider.notifier).state = movie.id;
                    context.push(Routes.detailMovie);
                  },
                )),
            
              ],
            ),
          ),
        ],
      )
    );
  }
}