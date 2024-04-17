import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/movies/domain/entities/movie.dart';
import 'package:my_movies/movies/presentation/cubit/movies_cubit.dart';
import 'package:my_movies/movies/presentation/widgets/movie_card.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

@override
void initState() {
  // blocprovider.of<MoviesCubit>(context).loadMovies();
  // SchedulerBinding.instance.addPostFrameCallback((_) {});
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    MoviesCubit moviesCubit = context.watch<MoviesCubit>();
    return BlocBuilder<MoviesCubit, MoviesStatus>(
      builder: (context, state) {
        Scaffold(
      appBar: AppBar(
        title: const Text('Movies Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          moviesCubit.loadMovies();
        },
        child: const Icon(Icons.refresh),
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
