import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/core/widgets/bottom_sheet.dart';
import 'package:my_movies/movies/presentation/cubit/movies_cubit.dart';
import 'package:my_movies/movies/presentation/views/side_bar.dart';
import 'package:my_movies/movies/presentation/widgets/filter.dart';
import 'package:my_movies/movies/presentation/widgets/movie_card.dart';
import 'package:my_movies/movies/presentation/widgets/order.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late MoviesCubit moviesCubit;

  @override
  void initState() {
    moviesCubit = BlocProvider.of<MoviesCubit>(context);
    moviesCubit.loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesStatus>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Movies Page'),
          ),
          drawer: const SideBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              moviesCubit.loadMovies();
            },
            child: const Icon(Icons.refresh),
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Movies',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          showSimpleCustomModalBottomSheet(context,
                              content: const Column(
                                children: [
                                  Order(),
                                  Filter(),
                                ],
                              ),
                              isDismissible: true);
                        },
                        icon: const Icon(Icons.filter_alt),
                        iconSize: 30,
                        color: Colors.deepPurple),
                  ],
                ),
              ),
              Flexible(
                child: RefreshIndicator(
                  triggerMode: RefreshIndicatorTriggerMode.anywhere,
                  // physics: const AlwaysScrollableScrollPhysics(),
                  onRefresh: () async {
                    return moviesCubit.getMoreMovies();
                  },
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: moviesCubit.movieList.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    reverse: false,
                    itemBuilder: (context, index) {
                      return MovieCard(movie: moviesCubit.movieList[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
