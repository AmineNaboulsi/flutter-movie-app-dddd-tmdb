import 'package:app/features/movie/domain/entities/movie.dart';

abstract class PageMovieState {}

//page initialisation
class InitialMovieState extends PageMovieState{}

//laoding all movies in first 
class LoadingAllMovieState extends PageMovieState{}

//succes retreived for teh movies
class SuccessLoadedMovieState extends PageMovieState{
  final List<Movie> movies;
  SuccessLoadedMovieState({
    required this.movies
  });
}

//faailed loading movies
class FailureLoadedMovieState extends PageMovieState{}

//searching for movies
class SearchLoadingState extends PageMovieState {
  final List<Movie> previousMovies; // keep the current list
  SearchLoadingState({required this.previousMovies});
}
