import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies/homePage/presentation/views/homepage.dart';
import 'package:my_movies/movies/presentation/views/movies_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => _rightToLeftTransition(context, state, const HomePage()),
      ),
      GoRoute(
        path: '/movies',
        name: 'movies',
        pageBuilder: (context, state) => _rightToLeftTransition(context, state, const MoviesPage()),
      ),
    ],
  );

  static Page<void> _rightToLeftTransition(
      BuildContext context, GoRouterState state, Widget child) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
