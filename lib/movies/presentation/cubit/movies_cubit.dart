import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/movies/domain/entities/movie.dart';

enum MoviesStatus { initial, loading, loaded, error }

class MoviesCubit extends Cubit<MoviesStatus> {
  MoviesCubit() : super(MoviesStatus.initial);

  late List<Movie> movies;

  void loadMovies() {
    emit(MoviesStatus.loading);
    try {
      // Load movies from the repository
      emit(MoviesStatus.loaded);
    } catch (e) {
      emit(MoviesStatus.error);
    }
  }
}
