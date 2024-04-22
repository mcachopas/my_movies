import 'package:flutter/material.dart';
import 'package:my_movies/movies/domain/entities/winner_count.dart';

class MultipleWinner extends StatelessWidget {
  final WinnerCount movie;

  const MultipleWinner({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(movie.year.toString()),
        subtitle: Text(movie.winnerCount.toString()), 
      ),
    );
  }
}