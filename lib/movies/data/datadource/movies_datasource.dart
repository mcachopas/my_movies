import 'package:my_movies/movies/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getMovies();
}
