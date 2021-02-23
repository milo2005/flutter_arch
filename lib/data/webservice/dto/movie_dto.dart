import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_dto.g.dart';

@JsonSerializable(nullable: true)
@immutable
class MovieDto {
  final int id;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  final String overview;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  final String title;
  @JsonKey(name: 'vote_average')
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

  factory MovieDto.fromJson(Map<String, dynamic> json) => _$MovieDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDtoToJson(this);

}
