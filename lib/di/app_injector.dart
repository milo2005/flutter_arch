import 'package:arquitectura/data/database/app_database.dart';
import 'package:arquitectura/data/database/entity/movie_entity_adapter.dart';
import 'package:arquitectura/data/repository/movie_repository_impl.dart';
import 'package:arquitectura/data/webservice/dto/movie_dto_adapter.dart';
import 'package:arquitectura/data/webservice/movie_api.dart';
import 'package:arquitectura/domain/model/movie.dart';
import 'package:arquitectura/domain/repository/movie_repository.dart';
import 'package:arquitectura/domain/usecase/movies/list_upcoming_movies.dart';
import 'package:arquitectura/env/environments.dart';
import 'package:arquitectura/presentation/pages/movies/movie_bloc.dart';
import 'package:arquitectura/util/network/verify_network.dart';
import 'package:arquitectura/util/network/verify_network_impl.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:dio/dio.dart';

final injector = KiwiContainer();

void setupInjector() {
  // Utils
  injector.registerSingleton<VerifyNetwork>((container) => VerifyNetworkImpl(
    DataConnectionChecker()
  ));

  // Datasources
  injector.registerSingleton(
      (container) => EnvironmentProvider.provideEnvironment());
  injector.registerSingleton((container) => AppDatabaseProvider());
  injector.registerSingleton((container) {

    final dio = Dio();

    dio.options = BaseOptions(
      baseUrl: container.resolve<Environment>().baseUrl,
    );

    return dio;
  });

  // Apis
  injector.registerSingleton((container) => MovieApi(container.resolve()));

  // Adapters
  injector.registerSingleton((container) => MovieDtoAdapter());
  injector.registerSingleton((container) => MovieEntityAdapter());

  // Repositories
  injector.registerSingleton<MovieRepository>((container) => MovieRepositoryImpl(
    container.resolve(),
    container.resolve(),
    container.resolve(),
    container.resolve(),
    container.resolve()
  ));

  // Uses Case
  injector.registerSingleton((container) => ListUpcomingMovies(container.resolve()));

  // Blocs
  injector.registerFactory((container) => MovieBloc(container.resolve()));
}
