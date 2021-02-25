import 'package:arquitectura/data/database/entity/movie_entity.dart';
import 'package:arquitectura/domain/model/movie.dart';
import 'package:arquitectura/domain/util/model_adapter.dart';

class MovieEntityAdapter extends ModelAdapter<Movie, MovieEntity>{

  @override
  MovieEntity fromModel(Movie model) => MovieEntity(
    releaseData: model.releaseDate,
    poster: model.poster,
    movieId: model.id,
    backdrop: model.backdrop,
    title: model.title,
    overview: model.overview
  );

  @override
  Movie toModel(MovieEntity external) => Movie(
    overview: external.overview,
    title: external.title,
    backdrop: external.backdrop,
    poster: external.poster,
    id: external.movieId,
    releaseDate: external.releaseData,
    score: external.score
  );

}