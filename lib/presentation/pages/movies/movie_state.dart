import 'package:arquitectura/domain/model/movie.dart';
import 'package:equatable/equatable.dart';

class MovieState extends Equatable {
  final bool loading;
  final String error;
  final bool empty;
  final List<Movie> data;

  MovieState({
    this.loading = true,
    this.error,
    this.empty = true,
    this.data = const [],
  });

  @override
  List<Object> get props => [
    loading,
    error,
    empty,
    data.length,
  ];

  MovieState copyWith({
    bool loading,
    String error,
    bool empty,
    List<Movie> data,
  }) {
    return new MovieState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      empty: empty ?? this.empty,
      data: data ?? this.data,
    );
  }
}
