  import 'dart:async';

  import 'package:app/features/movie/domain/entities/movie.dart';
import 'package:app/features/movie/domain/usecase/get_movies.dart';
  import 'package:app/features/movie/domain/usecase/search_movies.dart';
  import 'package:app/features/movie/presentation/bloc/movies-event.dart';
  import 'package:app/features/movie/presentation/bloc/movies-satate.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';

  class MoviesBloc extends Bloc<MoviesEvent,PageMovieState >{
    
    final SearchMovies searchMovies;
    final GetMovies getMovies;

    MoviesBloc(this.getMovies,this.searchMovies):super(InitialMovieState()){
      on<GetMoviesEvent>(_loadMovie);
      on<SearchingForMovie>(_SearForMovie);
      add(GetMoviesEvent());
    }

    Future<void> _loadMovie(GetMoviesEvent event, Emitter<PageMovieState> emit)
    async {
      emit(LoadingAllMovieState());
      final result = await getMovies();

      result.fold(
        (l) {
          emit(FailureLoadedMovieState());
        }, 
        (success) {
          emit(SuccessLoadedMovieState(
            movies: success
            ));
        });
    }

    Future<void> _SearForMovie(SearchingForMovie event, Emitter<PageMovieState> emit) async {
        final currentState = state;
        List<Movie> previousMovies = [];
        if (currentState is SuccessLoadedMovieState) {
          previousMovies = currentState.movies;
        }
        emit(SearchLoadingState(previousMovies: previousMovies));

        final result = await searchMovies(event.filter);
        
        result.fold(
          (failure) => emit(FailureLoadedMovieState()),
          (movies) => emit(SuccessLoadedMovieState(movies: movies)),
        );
    }
  }

