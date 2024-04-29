import 'package:my_movies/movies/domain/entities/movie.dart';
import 'package:my_movies/movies/domain/entities/movie_filter.dart';
import 'package:my_movies/movies/domain/entities/win_count.dart';
import 'package:my_movies/movies/domain/entities/winner_count.dart';
import 'package:my_movies/movies/domain/entities/winner_interval.dart';

abstract class MoviesDataSource {
  Future<List<Movie>> getMovies(MovieFilter filter);
  Future<List<WinCount>> getWinnersCount();
  Future<List<WinnerCount>> getWinnersCountByInterval();
  Future<ProducerInterval> getWinnerInterval();
}
