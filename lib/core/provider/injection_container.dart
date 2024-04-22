import 'package:get_it/get_it.dart';
import 'package:my_movies/movies/data/datadource/movies_datasource.dart';
// import 'package:my_movies/movies/data/datasourceImpl/movies_datasource_local.dart';
import 'package:my_movies/movies/data/datasourceImpl/movies_datasource_texoit.dart';
import 'package:my_movies/movies/presentation/cubit/movies_cubit.dart';
import 'package:my_movies/movies/services/movie_service.dart';

final injection = GetIt.instance;

Future<void> init() async {
  injection.registerSingleton<MoviesDatasource>(MoviesDatasourceTexoIt());
  injection.registerSingleton<MovieService>(MovieService());
  injection.registerSingleton<MoviesCubit>(MoviesCubit());
  }