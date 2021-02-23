import 'package:arquitectura/data/webservice/movie_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dioMock = DioMock();
  final api = MovieApi(dioMock);

  group('MovieApi', () {
    test(
        'should make a GET call to /movie/upcoming',
            () async {
          // Arrange
          final response = Response(
              statusCode: 200, data: {'results': [], 'total_pages': 0});

          when(dioMock.request(
              any,
              data: anyNamed('data'),
              options: anyNamed('options'),
              queryParameters: anyNamed('queryParameters')
          )).thenAnswer((realInvocation) async => response);

          // Act
          await api.upcomingMovies();

          // Assert
          verify(
              dioMock.request(
                  '/movie/upcoming',
                  data: {},
                  queryParameters: {},
                  options: argThat(
                    predicate<RequestOptions>((options)=> options.method == 'GET'),
                    named: 'options',)
              )
          );
        }
    );
  });
}