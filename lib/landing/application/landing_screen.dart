// Dependencies
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Constants
import 'package:moviedb/config/router/routes.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: const Text('Cartelera'),
            leading: const Icon(Icons.movie),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.push(Routes.nowPlaying),
          ),
          ListTile(
            title: const Text('Favoritos'),
            leading: const Icon(Icons.favorite),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.push(Routes.favorites),
          )
        ],
      ),
    );
  }
}
