import 'package:arquitectura/data/database/entity/movie_entity.dart';
import 'package:floor/floor.dart';
import 'dart:async';

@dao
abstract class MovieDao{

  @insert
  Future<void> insertMovies(List<MovieEntity> movies);

  @Query("SELECT * FROM movie")
  Future<List<MovieEntity>> listMovies();

  @Query("DELETE FROM movie")
  Future<void> clearMovies();

  @Query("SELECT * FROM movie")
  Stream<List<MovieEntity>> listenMovies();

}