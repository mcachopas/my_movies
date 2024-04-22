import 'dart:convert';

import 'package:my_movies/movies/data/datadource/movies_datasource.dart';
import 'package:my_movies/movies/domain/entities/movie.dart';
import 'package:my_movies/movies/domain/entities/movie_filter.dart';
import 'package:http/http.dart' as http;

class MoviesDatasourceTexoIt implements MoviesDatasource {

  @override
  Future<List<Movie>> getMovies(MovieFilter filter) async {
    try {
      String page = 'page=${filter.page}';
      String size = '&size=${filter.size}';
      String winner = '';

      if (filter.winner != null) {
        String winner = '&winner=${filter.winner}';
      }
      var url = Uri.parse(
          'https://tools.texoit.com/backend-java/api/movies?$page$size$winner');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        List<dynamic> movieList = responseData['content'];
        List<Movie> movies = movieList.map((movieJson) => Movie.fromJson(movieJson)).toList();
        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to load movies');
    }
  }
  
}
