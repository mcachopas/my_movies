import 'package:get_it/get_it.dart';
import 'package:my_movies/movies/data/data_source/movies_data_source.dart';
import 'package:my_movies/movies/domain/entities/movie.dart';
import 'package:my_movies/movies/domain/entities/movie_filter.dart';
import 'package:my_movies/movies/domain/entities/win_count.dart';
import 'package:my_movies/movies/domain/entities/winner_count.dart';
import 'package:my_movies/movies/domain/entities/winner_interval.dart';

class MovieService {
  MoviesDataSource dataSource = GetIt.instance.get<MoviesDataSource>();

  Future<List<Movie>> getMovies(MovieFilter filter) async {
    return await dataSource.getMovies(filter);
  }

  Future<List<WinCount>> getWinnersCount() async {
    return await dataSource.getWinnersCount();
  }

  Future<List<WinnerCount>> getWinnersCountByInterval() async {
    return await dataSource.getWinnersCountByInterval();
  }

  Future<ProducerInterval> getWinnerInterval() async {
    return await dataSource.getWinnerInterval();
  }
}
