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
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                context.pushNamed('multiple-winners');
              }, 
              child: const Text('Multiple Winners'),
            ),
            TextButton(
              onPressed: () {
                context.pushNamed('Top-Winners');
              }, 
              child: const Text('Top-Winners'),
            ),
            TextButton(
              onPressed: () {
                context.pushNamed('Winners-Interval');
              }, 
              child: const Text('Winners-Interval'),
            ),
            TextButton(
              onPressed: () {
                context.pushNamed('list-of-winners');
              }, 
              child: const Text('List of Winners'),
            ),
            TextButton(
              // tooltip: 'Movies',
              onPressed: () {
                context.pushNamed('movies');
              }, child: const Text('Movie List'),
              // icon: const Icon(Icons.movie),
              // iconSize: 100,
              // color: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }
}