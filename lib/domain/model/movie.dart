import 'package:flutter/foundation.dart';

@immutable
class Movie {
  final int id;
  final String title;
  final double score;
  final String overview;
  final String backdrop;
  final String poster;
  final String releaseDate;

  Movie({
    this.id,
    this.title,
    this.score,
    this.overview,
    this.backdrop,
    this.poster,
    this.releaseDate,
  });
}
