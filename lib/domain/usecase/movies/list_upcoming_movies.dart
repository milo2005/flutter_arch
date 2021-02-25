import 'package:arquitectura/domain/model/movie.dart';
import 'package:arquitectura/domain/repository/movie_repository.dart';

class ListUpcomingMovies{

  final MovieRepository _repository;

  ListUpcomingMovies(this._repository);

  Future<List<Movie>>call(){
    return _repository.listUpcoming();
  }

}