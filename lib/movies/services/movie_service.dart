import 'package:get_it/get_it.dart';
import 'package:my_movies/movies/data/datadource/movies_datasource.dart';
import 'package:my_movies/movies/domain/entities/movie.dart';

class MovieService {

MoviesDatasource datasource = GetIt.instance.get<MoviesDatasource>();

  Future<List<Movie>> getMovies() async {
    return await datasource.getMovies();
  }
}