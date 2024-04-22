import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/movies/presentation/cubit/movies_cubit.dart';
import 'package:my_movies/movies/presentation/widgets/multiple_winner.dart';

class YearsWithMultiWinners extends StatefulWidget {
  const YearsWithMultiWinners({super.key});


  @override
  State<YearsWithMultiWinners> createState() => _YearsWithMultiWinnersState();
}

class _YearsWithMultiWinnersState extends State<YearsWithMultiWinners> {

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
            title: const Text('Years With Multiple Winners'),
          ),
          body: Center(
            child: Flexible(
              child: ListView.builder(
                itemCount: moviesCubit.winnerCountList.length,
                itemBuilder: (context, index) {
                      return MultipleWinner(movie: moviesCubit.winnerCountList[index]);
                    },
                )
              )
            )
          );
      },
    );
  }
}