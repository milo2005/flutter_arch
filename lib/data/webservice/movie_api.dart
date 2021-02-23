import 'package:arquitectura/data/webservice/dto/movie_list_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'movie_api.g.dart';

@RestApi()
abstract class MovieApi{

  factory MovieApi(Dio dio) =>_MovieApi(dio);

  @GET('/movie/upcoming')
  Future<MovieListDto> upcomingMovies({@Query('page') int page});

}