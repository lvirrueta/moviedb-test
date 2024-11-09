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
      body: Center(
        child: TextButton.icon (
          onPressed: () => context.push(Routes.nowPlaying), 
          icon: const Icon(Icons.movie),
          label: const Text('MovieDB'),
        ),
      ),
    );
  }
}
