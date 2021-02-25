import 'package:arquitectura/data/webservice/dto/movie_dto.dart';
import 'package:arquitectura/domain/model/movie.dart';
import 'package:arquitectura/domain/util/model_adapter.dart';

class MovieDtoAdapter extends ModelAdapter<Movie, MovieDto >{
  @override
  MovieDto fromModel(Movie movie) => MovieDto(
    releaseDate: movie.releaseDate,
    id: movie.id,
    title: movie.title,
    overview: movie.overview,
    backdropPath: movie.backdrop,
    posterPath: movie.poster,
    voteAverage: movie.score
  );

  @override
  Movie toModel(MovieDto movieDto) => Movie(
    overview: movieDto.overview,
    title: movieDto.title,
    id: movieDto.id,
    releaseDate: movieDto.releaseDate,
    score: movieDto.voteAverage,
    poster: movieDto.posterPath,
    backdrop: movieDto.backdropPath
  );

}