import 'package:arquitectura/domain/model/movie.dart';
import 'package:arquitectura/domain/repository/movie_repository.dart';

class ListLatestMovie{

  final MovieRepository repository;

  ListLatestMovie(this.repository);


  Future<List<Movie>> call(){
    return repository.listLatest();
  }

}