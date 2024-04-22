import 'package:get_it/get_it.dart';
import 'package:my_movies/movies/data/datadource/movies_datasource.dart';
import 'package:my_movies/movies/domain/entities/movie.dart';
import 'package:my_movies/movies/domain/entities/movie_filter.dart';
import 'package:my_movies/movies/domain/entities/win_count.dart';
import 'package:my_movies/movies/domain/entities/winner_count.dart';
import 'package:my_movies/movies/domain/entities/winner_interval.dart';

class MovieService {

MoviesDatasource datasource = GetIt.instance.get<MoviesDatasource>();

  Future<List<Movie>> getMovies(MovieFilter filter) async {
    return await datasource.getMovies(filter);
  }

  Future<List<WinCount>> getWinnersCount() async {
    return await datasource.getWinnersCount();
  }

  Future<List<WinnerCount>> getWinnersCountByInterval() async {
    return await datasource.getWinnersCountByInterval();
  }
  
  Future<List<WinnerInterval>> getWinnerInterval() async {
    return await datasource.getWinnerInterval();
  }
}