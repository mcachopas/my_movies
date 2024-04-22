import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movies/movies/domain/entities/movie.dart';
import 'package:my_movies/movies/domain/entities/movie_filter.dart';
import 'package:my_movies/movies/domain/entities/win_count.dart';
import 'package:my_movies/movies/domain/entities/winner_count.dart';
import 'package:my_movies/movies/domain/entities/winner_interval.dart';
import 'package:my_movies/movies/services/movie_service.dart';

enum MoviesStatus { initial, loading, loaded, error }

class MoviesCubit extends Cubit<MoviesStatus> {
  MoviesCubit() : super(MoviesStatus.initial);

  MovieService movieService = GetIt.instance.get<MovieService>();
  // final ScrollController scrollController = ScrollController();
  late List<Movie> movieList = [];
  late List<WinCount> winCountList = [];
  late List<WinnerCount> winnerCountList = [];
  late List<WinnerInterval> winnerIntervalList = [];

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

  Future<void> loadMultipleWinners() async {
    emit(MoviesStatus.loading);
    try {
      winCountList = await movieService.getWinnersCount();
      emit(MoviesStatus.loaded);
    } catch (e) {
      emit(MoviesStatus.error);
    }
  }

  Future<void> loadWinnersCountByInterval() async {
    emit(MoviesStatus.loading);
    try {
      winnerCountList = await movieService.getWinnersCountByInterval();
      emit(MoviesStatus.loaded);
    } catch (e) {
      emit(MoviesStatus.error);
    }
  }

  Future<void> loadWinnerInterval() async {
    emit(MoviesStatus.loading);
    try {
      winnerIntervalList = await movieService.getWinnerInterval();
      emit(MoviesStatus.loaded);
    } catch (e) {
      emit(MoviesStatus.error);
    }
  }

  Future<void> getMoreMovies() async {
    filter.page++;
    emit(MoviesStatus.loading);
    try {
      movieList.addAll(await movieService.getMovies(filter));
      emit(MoviesStatus.loaded);
    } catch (e) {
      emit(MoviesStatus.error);
    }
  }
}
