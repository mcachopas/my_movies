import 'package:get_it/get_it.dart';
import 'package:my_movies/movies/data/data_source/movies_data_source.dart';
import 'package:my_movies/movies/data/data_source_impl/movies_data_source_texo_it.dart';
import 'package:my_movies/movies/presentation/cubit/movies_cubit.dart';
import 'package:my_movies/movies/services/movie_service.dart';

final injection = GetIt.instance;

Future<void> init() async {
  injection.registerSingleton<MoviesDataSource>(MoviesDataSourceTexoIt());
  injection.registerSingleton<MovieService>(MovieService());
  injection.registerSingleton<MoviesCubit>(MoviesCubit());
}
