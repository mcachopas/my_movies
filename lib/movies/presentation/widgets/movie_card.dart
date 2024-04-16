import 'package:flutter/material.dart';
import 'package:my_movies/movies/domain/entities/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(movie.title),
              Text('${movie.year}'),
            ],
          ),
        ),
      ),
    );
  }
}
