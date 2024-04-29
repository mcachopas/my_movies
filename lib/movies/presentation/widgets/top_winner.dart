import 'package:flutter/material.dart';
import 'package:my_movies/movies/domain/entities/win_count.dart';

class TopWinner extends StatelessWidget {
  final WinCount movie;
  const TopWinner({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(movie.name),
        subtitle: Text(movie.winCount.toString()),
      ),
    );
  }
}
