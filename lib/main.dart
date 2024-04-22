import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/core/provider/application_binder.dart';
import 'package:my_movies/core/provider/go_router.dart';
import 'package:my_movies/core/provider/injection_container.dart';
import 'package:my_movies/movies/presentation/cubit/movies_cubit.dart';

Future<void> main() async {
  await init();
  runApp(
    BlocProvider(
      create: (context) => MoviesCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        // home: const HomePage(),
      ),
    );
  }
}
