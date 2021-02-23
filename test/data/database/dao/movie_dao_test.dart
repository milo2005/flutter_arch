import 'package:arquitectura/data/database/app_database.dart';
import 'package:arquitectura/data/database/entity/movie_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final database = await AppDatabaseProvider.inMemoryDatabase();
  final movieDao = database.movieDao;
  final List<MovieEntity> data = [
    MovieEntity(
        title: 'test title',
        overview: 'test overview',
        backdrop: 'backdrop',
        movieId: 123,
        poster: 'poster',
        releaseData: '2021-02-28')
  ];

  group('MovieDao', () {
    test('should insert a list of movies', () async {
      // Act
      await movieDao.insertMovies(data);
      final result = await movieDao.listMovies();

      // Assert
      expect(result.length, 1);
    });

    test('should clean the database', () async {
      // Act
      await movieDao.insertMovies(data);
      await movieDao.clearMovies();
      final result = await movieDao.listMovies();

      // Assert
      expect(result.length, 0);
    });

    test('should emit changes in the database', () async {
      // Act
      await movieDao.insertMovies(data);
      final resultStream = movieDao.listenMovies();
      // Assert
      expect(resultStream, emits(
          predicate<List<MovieEntity>>((result)=> result[0].title == data[0].title)
      ));
    });
  });
}
