import 'package:arquitectura/data/database/app_database.dart';
import 'package:arquitectura/data/database/dao/movie_dao.dart';
import 'package:arquitectura/data/database/entity/movie_entity_adapter.dart';
import 'package:arquitectura/data/webservice/dto/movie_dto_adapter.dart';
import 'package:arquitectura/data/webservice/movie_api.dart';
import 'package:arquitectura/domain/model/movie.dart';
import 'package:arquitectura/domain/repository/movie_repository.dart';
import 'package:arquitectura/util/network/verify_network.dart';

class MovieRepositoryImpl implements MovieRepository {
  final AppDatabaseProvider _appDatabase;
  final MovieApi _movieApi;

  final MovieDtoAdapter _movieDtoAdapter;
  final MovieEntityAdapter _movieEntityAdapter;

  final VerifyNetwork _verifyNetwork;

  Future<MovieDao> get movieDao async {
    final database = await _appDatabase.database;
    return database.movieDao;
  }

  MovieRepositoryImpl(
    this._appDatabase,
    this._movieApi,
    this._movieDtoAdapter,
    this._movieEntityAdapter,
    this._verifyNetwork,
  );

  @override
  Future<List<Movie>> listUpcoming() async {
    final isConnected = await _verifyNetwork.isConnected();
    return isConnected ? remoteMovies() : localMovies();
  }

  Future<List<Movie>> localMovies() async {
    final dao = await movieDao;
    final localMovies =  await dao.listMovies();
    return _movieEntityAdapter.toListModel(localMovies);
  }

  Future<List<Movie>> remoteMovies() async{
    final dao = await movieDao;
    final remoteMovies = await _movieApi.upcomingMovies();
    final movies = _movieDtoAdapter.toListModel(remoteMovies.results);

    final localMovies = _movieEntityAdapter.fromListModel(movies);
    await dao.clearMovies();
    await dao.insertMovies(localMovies);

    return movies;
  }
}
