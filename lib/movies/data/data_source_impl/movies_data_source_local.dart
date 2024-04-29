import 'package:my_movies/movies/data/data_source/movies_data_source.dart';
import 'package:my_movies/movies/domain/entities/movie.dart';
import 'package:my_movies/movies/domain/entities/movie_filter.dart';
import 'package:my_movies/movies/domain/entities/win_count.dart';
import 'package:my_movies/movies/domain/entities/winner_count.dart';
import 'package:my_movies/movies/domain/entities/winner_interval.dart';

class MoviesDataSourceLocal implements MoviesDataSource {
  @override
  Future<List<Movie>> getMovies(MovieFilter filter) async {
    return movieList;
  }

  @override
  Future<List<WinCount>> getWinnersCount() {
    throw UnimplementedError();
  }

  @override
  Future<List<WinnerCount>> getWinnersCountByInterval() {
    throw UnimplementedError();
  }

  @override
  Future<ProducerInterval> getWinnerInterval() {
    throw UnimplementedError();
  }
}

List<Movie> movieList = [
  Movie(
    id: 1,
    title: 'The Shawshank Redemption',
    // director: 'Frank Darabont',
    year: 1994,
    studios: [], producers: [], winner: false,
  ),
  Movie(
    id: 2,
    title: 'The Godfather',
    // director: 'Francis Ford Coppola',
    year: 1972,
    studios: [], producers: [], winner: false,
  ),
  Movie(
    id: 3,
    title: 'The Dark Knight',
    // director: 'Christopher Nolan',
    year: 2008,
    studios: [], producers: [], winner: false,
  )
];
