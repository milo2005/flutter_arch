// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListDto _$MovieListDtoFromJson(Map<String, dynamic> json) {
  return MovieListDto(
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : MovieDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalPages: json['total_pages'] as int,
  );
}

Map<String, dynamic> _$MovieListDtoToJson(MovieListDto instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
      'total_pages': instance.totalPages,
    };
