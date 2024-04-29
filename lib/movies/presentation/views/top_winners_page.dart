import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/movies/presentation/cubit/movies_cubit.dart';
import 'package:my_movies/movies/presentation/widgets/top_winner.dart';

class TopWinnersPage extends StatefulWidget {
  const TopWinnersPage({super.key});

  @override
  State<TopWinnersPage> createState() => _TopWinnersPageState();
}

class _TopWinnersPageState extends State<TopWinnersPage> {
  late MoviesCubit moviesCubit;

  @override
  void initState() {
    moviesCubit = BlocProvider.of<MoviesCubit>(context);
    moviesCubit.loadMultipleWinners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesStatus>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Top Winners'),
            ),
            body: Center(
                child: Flexible(
                    child: ListView.builder(
              itemCount: moviesCubit.winCountList.length,
              itemBuilder: (context, index) {
                return TopWinner(
                    movie: moviesCubit.winCountList[index]);
              },
            ))));
      },
    );
  }
}