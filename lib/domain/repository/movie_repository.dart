import 'package:arquitectura/domain/model/movie.dart';

abstract class MovieRepository{

  Future<List<Movie>> listUpcoming();

}