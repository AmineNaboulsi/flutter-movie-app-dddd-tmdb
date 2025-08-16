import 'package:app/core/error/server-exception.dart';
import 'package:app/features/movie/data/datasource/movie-datasource.dart';
import 'package:app/features/movie/domain/entities/movie.dart';
import 'package:app/features/movie/domain/repository/movie-repository.dart';
import 'package:app/features/movie/presentation/bloc/movies-event.dart';
import 'package:dartz/dartz.dart';

class MoviesRepositoryImpl extends MovieRepository{

  final MovieDatasourceImpl movieDatasourceImpl ;

  MoviesRepositoryImpl(this.movieDatasourceImpl);
  
  @override
  Future<Either<Failure, List<Movie>>> getMovies() {
    return movieDatasourceImpl.getMovies();
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovie(Filter f) {
    return movieDatasourceImpl.searchMovie(f);
  }

}
