import 'package:flutter/foundation.dart';

@immutable
class Movie{

  final String title;
  final int score;
  final String overview;
  final String image;

  Movie({this.title, this.score, this.overview, this.image});
}