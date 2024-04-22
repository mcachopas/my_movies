import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movies/movies/domain/entities/movie.dart';
import 'package:my_movies/movies/domain/entities/movie_filter.dart';
import 'package:my_movies/movies/services/movie_service.dart';

enum MoviesStatus { initial, loading, loaded, error }

class MoviesCubit extends Cubit<MoviesStatus> {
  MoviesCubit() : super(MoviesStatus.initial);

  MovieService movieService = GetIt.instance.get<MovieService>();
  late List<Movie> movieList = [];
  var getIt = GetIt.instance;
  MovieFilter filter = MovieFilter(page: 0, size: 10);

  Future<void> loadMovies() async {
    emit(MoviesStatus.loading);
    try {
      movieList = await movieService.getMovies(filter);
      emit(MoviesStatus.loaded);
    } catch (e) {
      emit(MoviesStatus.error);
    }
  }
}
