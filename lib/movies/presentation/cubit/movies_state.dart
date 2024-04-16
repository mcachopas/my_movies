import 'package:equatable/equatable.dart';

class MoviesStatus extends Equatable {
  const MoviesStatus._(this.value);

  final String value;

  static const initial = MoviesStatus._('initial');
  static const loading = MoviesStatus._('loading');
  static const loaded = MoviesStatus._('loaded');
  static const error = MoviesStatus._('error');

  @override
  List<Object> get props => [value];
}
