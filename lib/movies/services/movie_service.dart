import 'package:get_it/get_it.dart';
import 'package:my_movies/movies/data/datadource/movies_datasource.dart';
import 'package:my_movies/movies/domain/entities/movie.dart';
import 'package:my_movies/movies/domain/entities/movie_filter.dart';

class MovieService {

MoviesDatasource datasource = GetIt.instance.get<MoviesDatasource>();

  Future<List<Movie>> getMovies(MovieFilter filter) async {
    return await datasource.getMovies(filter);
  }
}