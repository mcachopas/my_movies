import 'package:my_movies/movies/domain/entities/movie.dart';
import 'package:my_movies/movies/domain/entities/movie_filter.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getMovies(MovieFilter filter);
}
