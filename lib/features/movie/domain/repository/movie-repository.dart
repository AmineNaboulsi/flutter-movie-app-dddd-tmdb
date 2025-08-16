import 'package:app/core/error/server-exception.dart';
import 'package:app/features/movie/domain/entities/movie.dart';
import 'package:app/features/movie/presentation/bloc/movies-event.dart';
import 'package:dartz/dartz.dart';
abstract class MovieRepository {
  Future<Either<Failure,List<Movie>>> getMovies();
  Future<Either<Failure, List<Movie>>> searchMovie(Filter f);
}