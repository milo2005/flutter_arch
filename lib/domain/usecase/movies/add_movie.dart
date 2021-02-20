import 'package:arquitectura/domain/model/movie.dart';
import 'package:arquitectura/domain/repository/movie_repository.dart';

class AddMovie{

  final MovieRepository repository;

  AddMovie(this.repository);

  Future call(Movie movie){
    return repository.insertMovie(movie);
  }
}