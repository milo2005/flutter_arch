import 'package:flutter/cupertino.dart';

@immutable
class MovieDto {
  final int id;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final String title;
  final double voteAverage;

  MovieDto({
    this.id,
    this.posterPath,
    this.backdropPath,
    this.overview,
    this.releaseDate,
    this.title,
    this.voteAverage,
  });
}
