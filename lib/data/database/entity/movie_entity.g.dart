// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieEntity _$MovieEntityFromJson(Map<String, dynamic> json) {
  return MovieEntity(
    id: json['id'] as int,
    movieId: json['movieId'] as int,
    title: json['title'] as String,
    overview: json['overview'] as String,
    backdrop: json['backdrop'] as String,
    poster: json['poster'] as String,
    releaseData: json['releaseData'] as String,
  );
}

Map<String, dynamic> _$MovieEntityToJson(MovieEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'movieId': instance.movieId,
      'title': instance.title,
      'overview': instance.overview,
      'backdrop': instance.backdrop,
      'poster': instance.poster,
      'releaseData': instance.releaseData,
    };
