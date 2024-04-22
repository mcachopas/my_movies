import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movies/movies/domain/entities/movie.dart';
import 'package:my_movies/movies/services/movie_service.dart';

enum MoviesStatus { initial, loading, loaded, error }

class MoviesCubit extends Cubit<MoviesStatus> {
  MoviesCubit() : super(MoviesStatus.initial);

  MovieService movieService = GetIt.instance.get<MovieService>();
  late List<Movie> movieList = [];
  var getIt = GetIt.instance;

  Future<void> loadMovies() async {
    emit(MoviesStatus.loading);
    try {
      movieList = await movieService.getMovies();
      emit(MoviesStatus.loaded);
    } catch (e) {
      emit(MoviesStatus.error);
    }
  }
}
