import 'package:my_movies/movies/data/datadource/movies_datasource.dart';
import 'package:my_movies/movies/domain/entities/movie.dart';
import 'package:my_movies/movies/domain/entities/movie_filter.dart';

class MoviesDatasourceLocal implements MoviesDatasource {
  @override
  Future<List<Movie>> getMovies(MovieFilter filter) async {
    return movieList;
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
