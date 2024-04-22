import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/core/widgets/text_field.dart';
import 'package:my_movies/movies/presentation/cubit/movies_cubit.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesStatus>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          height: 300,
          child: Column(
            children: [
              const Text('Filter'),
              const Text('Date'),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('From:'),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: RoundedCornerTextField(),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text('To:'),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: RoundedCornerTextField(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Text('Winners'),
              DropdownButton<String>(
                    value: 'All',
                    items: <String>['All', 'Yes', 'No']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {},
                  ),
            ],
          ),
        );
      },
    );
  }
}

