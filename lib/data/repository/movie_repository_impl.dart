import 'package:arquitectura/data/webservice/movie_api.dart';
import 'package:arquitectura/domain/model/movie.dart';
import 'package:arquitectura/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository{

  final MovieApi api;

  MovieRepositoryImpl(this.api);

  @override
  Future insertMovie(Movie movie) {

  }

  @override
  Future<List<Movie>> listLatest() {
    // TODO: implement listLatest
    throw UnimplementedError();
  }

}