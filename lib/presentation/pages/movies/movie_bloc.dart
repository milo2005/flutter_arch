import 'package:arquitectura/domain/usecase/movies/list_upcoming_movies.dart';
import 'package:arquitectura/presentation/pages/movies/movie_state.dart';
import 'package:bloc/bloc.dart';

class MovieBloc extends Cubit<MovieState>{

  final ListUpcomingMovies _listUpcomingMovies;

  MovieBloc(this._listUpcomingMovies) : super(MovieState());

  void loadMovies() async{
    try{
      emit(state.copyWith(loading: true));

      final data = await _listUpcomingMovies();

      emit(state.copyWith(loading: false, data: data, empty:  data.isEmpty));
    }catch(e){
      emit(state.copyWith(loading: false, error: 'Error al cargar peliculas'));
    }
  }

}