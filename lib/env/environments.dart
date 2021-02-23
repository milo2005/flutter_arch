import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

@immutable
class Environment {
  final String baseUrl;
  final String apiKey;

  Environment({this.baseUrl, this.apiKey});
}

class EnvironmentProvider {
  static Environment provideEnvironment() => kReleaseMode
      // Production
      ? Environment(
          baseUrl: 'https://api.themoviedb.org/3/',
          apiKey: '357a7cd84e31ba07c539d1d78c26662e',
        )
      // Develop
      : Environment(
          baseUrl: 'https://api.themoviedb.org/3/',
          apiKey: '357a7cd84e31ba07c539d1d78c26662e',
        );
}
