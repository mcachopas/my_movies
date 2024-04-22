import 'dart:convert';

import 'package:my_movies/movies/data/datadource/movies_datasource.dart';
import 'package:my_movies/movies/domain/entities/movie.dart';
import 'package:my_movies/movies/domain/entities/movie_filter.dart';
import 'package:http/http.dart' as http;
import 'package:my_movies/movies/domain/entities/win_count.dart';
import 'package:my_movies/movies/domain/entities/winner_count.dart';
import 'package:my_movies/movies/domain/entities/winner_interval.dart';

class MoviesDatasourceTexoIt implements MoviesDatasource {

  static const String baseUrl = 'https://tools.texoit.com/backend-java/api/movies';

  @override
  Future<List<Movie>> getMovies(MovieFilter filter) async {
    try {
      String page = 'page=${filter.page}';
      String size = '&size=${filter.size}';
      String winner = '';

      if (filter.winner != null) {
          winner = '&winner=${filter.winner}';
      }
      var url = Uri.parse(
          '$baseUrl?$page$size$winner');
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

  @override
  Future<List<WinnerInterval>> getWinnerInterval() async {
    try {
      String projection = 'projection=max-min-win-interval-for-producers';

      var url = Uri.parse(
          '$baseUrl?$projection');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        List<dynamic> movieList = responseData['content'];
        List<WinnerInterval> movies = movieList.map((movieJson) => WinnerInterval.fromJson(movieJson)).toList();
        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Future<List<WinCount>> getWinnersCount() async {
    try {
      String projection = 'projection=studios-with-win-count';

      var url = Uri.parse(
          '$baseUrl?$projection');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        List<dynamic> studioList = responseData['studios'];
        List<WinCount> studios = studioList.map((studioJson) => WinCount.fromJson(studioJson)).toList();
        return studios;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Future<List<WinnerCount>> getWinnersCountByInterval() async {
    try {
      String projection = 'projection=years-with-multiple-winners';

      var url = Uri.parse(
          '$baseUrl?$projection');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        List<dynamic> movieList = responseData['content'];
        List<WinnerCount> movies = movieList.map((movieJson) => WinnerCount.fromJson(movieJson)).toList();
        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to load movies');
    }
  }
  
}
