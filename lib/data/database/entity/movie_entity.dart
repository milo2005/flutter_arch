import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_entity.g.dart';

@immutable
@Entity(tableName: 'movie')
@JsonSerializable(nullable: true)
class MovieEntity {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final int movieId;
  final String title;
  final String overview;
  final String backdrop;
  final String poster;
  final String releaseData;
  final double score;

  MovieEntity({
    this.id,
    this.movieId,
    this.title,
    this.overview,
    this.backdrop,
    this.poster,
    this.releaseData,
    this.score
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) => _$MovieEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieEntityToJson(this);
}
