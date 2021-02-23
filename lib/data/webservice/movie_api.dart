import 'package:arquitectura/data/webservice/dto/movie_dto.dart';

abstract class MovieApi{

  Future<List<MovieDto>> listMovies();

}