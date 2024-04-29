import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies/home_page/presentation/views/homepage.dart';
import 'package:my_movies/movies/presentation/views/movies_page.dart';
import 'package:my_movies/movies/presentation/views/producers_interval_page.dart';
import 'package:my_movies/movies/presentation/views/top_winners_page.dart';
import 'package:my_movies/movies/presentation/views/years_multiple_winners.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) =>
            _rightToLeftTransition(context, state, const HomePage()),
      ),
      GoRoute(
        path: '/movies',
        name: 'movies',
        pageBuilder: (context, state) =>
            _rightToLeftTransition(context, state, const MoviesPage()),
      ),
      GoRoute(
        path: '/multiple-winners',
        name: 'multiple-winners',
        pageBuilder: (context, state) => _rightToLeftTransition(
            context, state, const YearsWithMultiWinners()),
      ),
      GoRoute(
        path: '/Top-Winners',
        name: 'Top-Winners',
        pageBuilder: (context, state) =>
            _rightToLeftTransition(context, state, const TopWinnersPage()),
      ),
      GoRoute(
        path: '/Winners-Interval',
        name: 'Winners-Interval',
        pageBuilder: (context, state) => _rightToLeftTransition(
            context, state, const ProducersIntervalPage()),
      ),
      GoRoute(
        path: '/list-of-winners',
        name: 'list-of-winners',
        pageBuilder: (context, state) =>
            _rightToLeftTransition(context, state, const HomePage()),
      ),
      GoRoute(
        path: '/years-with-multi-winners',
        name: 'years-with-multi-winners',
        pageBuilder: (context, state) =>
            _rightToLeftTransition(context, state, const HomePage()),
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
