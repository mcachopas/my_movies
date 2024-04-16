import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_movies/movies/domain/entities/movie.dart';
import 'package:my_movies/movies/presentation/cubit/movies_cubit.dart';
import 'package:my_movies/movies/presentation/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

@override
void initState() {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    context.read<MoviesCubit>().loadMovies();
  });
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    MoviesCubit moviesCubit = context.watch<MoviesCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies Page'),
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return MovieCard(movie: moviesCubit.movies[index]);
        },
      ),
    );
  }
}

List<Movie> movieList = [];
