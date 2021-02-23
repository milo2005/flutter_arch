import 'package:arquitectura/data/database/dao/movie_dao.dart';
import 'package:arquitectura/data/database/entity/movie_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [MovieEntity])
abstract class AppDatabase extends FloorDatabase {
  MovieDao get movieDao;
}

class AppDatabaseProvider {
  static AppDatabase _appDatabase;

  static Future<AppDatabase> get database async {
    if (_appDatabase == null) {
      _appDatabase =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    }

    return _appDatabase;
  }

  static Future<AppDatabase> inMemoryDatabase() async {
    return $FloorAppDatabase.inMemoryDatabaseBuilder().build();
  }

}
