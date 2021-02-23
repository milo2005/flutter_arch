import 'package:flutter/cupertino.dart';

@immutable
class MovieEntity {
  final int id;
  final int movieId;
  final String title;
  final String overview;
  final String backdrop;
  final String poster;
  final String releaseData;

  MovieEntity({
    this.id,
    this.movieId,
    this.title,
    this.overview,
    this.backdrop,
    this.poster,
    this.releaseData,
  });
}
