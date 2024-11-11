
// Dependencies
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Models
import 'package:moviedb/movie/domain/model/movie.dart';

// Providers
import 'package:moviedb/movie/domain/provider/movie_provider.dart';

// Constants
import 'package:moviedb/config/router/routes.dart';


class MovieCardWidget extends ConsumerWidget {
  final Movie movie;

  const MovieCardWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(movieIdProvider.notifier).state = movie.id;
        context.push(Routes.detailMovie);
      },
      child: Container(
        height: 200,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(movie.backdropImage),
            fit: BoxFit.cover,
          ),
        ),
      
        child: Card(
          color: const Color.fromARGB(64, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListTile(
                textColor: Colors.white,
                title: Text(movie.title),
              ),
      
              // Text(movie.overview),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      DateFormat('dd MMM yyyy').format(movie.releaseDate),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      
                    ),
                  ),
                  FilledButton(
                    onPressed: (){}, 
                    child: Text('${movie.voteAverage} %')
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}