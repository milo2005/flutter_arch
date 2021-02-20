import 'package:arquitectura/domain/model/movie.dart';
import 'package:arquitectura/domain/repository/movie_repository.dart';
import 'package:arquitectura/domain/usecase/movies/list_latest_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MovieRepositoryMock extends Mock implements MovieRepository {}

void main() {
  group('ListLatestMovies', () {
    final movieRepository = MovieRepositoryMock();
    final listLatestMovie = ListLatestMovie(movieRepository);

    test('should call listLatest from MovieRepository', () async {
      // Arrange
      when(movieRepository.listLatest()).thenAnswer((realInvocation) async =>
      [
      ]);

      // Act
      listLatestMovie();

      // Assert
      verify(movieRepository.listLatest()).called(1);
    });

    test('should return a list of movies', () async {
      // Arrange
      final List<Movie> data = [
        Movie(title: 'Test title', overview: 'Test Overview')
      ];
      when(movieRepository.listLatest())
          .thenAnswer((realInvocation) async => data);

      // Act
      final result = await  listLatestMovie();

      // Assert
      expect(result, data);
    });
  });
}
