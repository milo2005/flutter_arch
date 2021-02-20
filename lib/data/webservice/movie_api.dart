import 'package:arquitectura/data/webservice/dto/MovieDto.dart';

abstract class MovieApi{

  Future<List<MovieDto>> listMovies();

}