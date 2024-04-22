import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/movies/presentation/cubit/movies_cubit.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesStatus>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          height: 150,
          child: Column(
            children: [
              const Text('Order By'),
              const Text('Date'),
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

