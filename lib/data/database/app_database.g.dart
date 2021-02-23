// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDao _movieDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `movie` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `movieId` INTEGER, `title` TEXT, `overview` TEXT, `backdrop` TEXT, `poster` TEXT, `releaseData` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _movieEntityInsertionAdapter = InsertionAdapter(
            database,
            'movie',
            (MovieEntity item) => <String, dynamic>{
                  'id': item.id,
                  'movieId': item.movieId,
                  'title': item.title,
                  'overview': item.overview,
                  'backdrop': item.backdrop,
                  'poster': item.poster,
                  'releaseData': item.releaseData
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieEntity> _movieEntityInsertionAdapter;

  @override
  Future<List<MovieEntity>> listMovies() async {
    return _queryAdapter.queryList('SELECT * FROM movie',
        mapper: (Map<String, dynamic> row) => MovieEntity(
            id: row['id'] as int,
            movieId: row['movieId'] as int,
            title: row['title'] as String,
            overview: row['overview'] as String,
            backdrop: row['backdrop'] as String,
            poster: row['poster'] as String,
            releaseData: row['releaseData'] as String));
  }

  @override
  Future<void> clearMovies() async {
    await _queryAdapter.queryNoReturn('DELETE FROM movie');
  }

  @override
  Stream<List<MovieEntity>> listenMovies() {
    return _queryAdapter.queryListStream('SELECT * FROM movie',
        queryableName: 'movie',
        isView: false,
        mapper: (Map<String, dynamic> row) => MovieEntity(
            id: row['id'] as int,
            movieId: row['movieId'] as int,
            title: row['title'] as String,
            overview: row['overview'] as String,
            backdrop: row['backdrop'] as String,
            poster: row['poster'] as String,
            releaseData: row['releaseData'] as String));
  }

  @override
  Future<void> insertMovies(List<MovieEntity> movies) async {
    await _movieEntityInsertionAdapter.insertList(
        movies, OnConflictStrategy.abort);
  }
}
