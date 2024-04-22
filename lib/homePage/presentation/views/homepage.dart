import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const MoviesPage()));
            context.pushNamed('movies');
          },
          icon: const Icon(Icons.movie),
          iconSize: 100,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}