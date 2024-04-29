import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_movies/movies/domain/entities/winner_interval.dart';

class ProducerIntervalWidget extends StatelessWidget {
  final ProducerInterval interval;
  const ProducerIntervalWidget({super.key, required this.interval});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
              itemCount: interval.maxWinnerIntervals.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(interval.maxWinnerIntervals[index].producer),
                    subtitle:
                        Text('${interval.maxWinnerIntervals[index].interval}'),
                  ),
                );
              }),
        ),
        Flexible(
          child: ListView.builder(
              itemCount: interval.minWinnerIntervals.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(interval.minWinnerIntervals[index].producer),
                    subtitle:
                        Text('${interval.minWinnerIntervals[index].interval}'),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
