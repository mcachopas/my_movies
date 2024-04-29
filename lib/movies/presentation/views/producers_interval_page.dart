import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/movies/domain/entities/winner_interval.dart';
import 'package:my_movies/movies/presentation/cubit/movies_cubit.dart';
import 'package:my_movies/movies/presentation/widgets/producer_interval_widget.dart';

class ProducersIntervalPage extends StatefulWidget {
  const ProducersIntervalPage({super.key});

  @override
  State<ProducersIntervalPage> createState() => _ProducersIntervalPageState();
}

class _ProducersIntervalPageState extends State<ProducersIntervalPage> {
  late MoviesCubit moviesCubit;

  @override
  void initState() {
    moviesCubit = BlocProvider.of<MoviesCubit>(context);
    moviesCubit.loadWinnerInterval();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Producers Interval'),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: ProducerIntervalWidget(
                interval: moviesCubit.winnerIntervalList as ProducerInterval,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
