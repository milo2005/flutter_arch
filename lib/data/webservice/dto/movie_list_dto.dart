import 'package:arquitectura/data/webservice/dto/movie_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_list_dto.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
@immutable
class MovieListDto{

  final List<MovieDto> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;

  MovieListDto({this.results, this.totalPages});

  factory MovieListDto.fromJson(Map<String, dynamic> json) => _$MovieListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListDtoToJson(this);
}