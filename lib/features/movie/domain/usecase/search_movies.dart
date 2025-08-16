import 'package:app/core/error/server-exception.dart';
import 'package:app/features/movie/domain/entities/movie.dart';
import 'package:app/features/movie/domain/repository/movie-repository.dart';
import 'package:app/features/movie/presentation/bloc/movies-event.dart';
import 'package:dartz/dartz.dart';

class SearchMovies {

  final MovieRepository movieRepository ;

  SearchMovies(this.movieRepository);
  
  Future<Either<Failure, List<Movie>>> call(Filter f) async {
    return await movieRepository.searchMovie(f);
  }

}