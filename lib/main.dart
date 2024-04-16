import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/movies/presentation/cubit/movies_cubit.dart';
import 'package:my_movies/movies/presentation/views/movies_page.dart';

// final getIt = GetIt.instance;

void main() {
  runApp(
    BlocProvider(
      create: (context) => MoviesCubit(),
      child: const MyApp(),
    ),
  );
}

// void setupLocator() {
//   getIt.registerSingleton<MoviesDatasource>(MoviesDatasourceLocal());
//   getIt.registerFactory(() => MoviesCubit());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MoviesPage(),
    );
  }
}
