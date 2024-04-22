import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movies/movies/presentation/cubit/movies_cubit.dart';

class ApplicationBinding extends StatefulWidget {
  final Widget child;
  const ApplicationBinding({
    super.key,
    required this.child,
  });

  @override
  State<ApplicationBinding> createState() => _ApplicationBindingState();
}

class _ApplicationBindingState extends State<ApplicationBinding> {
  @override
  Widget build(BuildContext context) {
    GetIt getIt = GetIt.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<MoviesCubit>(),
        )
      ], 
      child: widget.child,
    );
  }
}