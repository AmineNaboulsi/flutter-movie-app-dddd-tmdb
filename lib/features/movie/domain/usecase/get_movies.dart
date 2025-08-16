import 'package:app/core/error/server-exception.dart';
import 'package:app/features/movie/domain/entities/movie.dart';
import 'package:app/features/movie/domain/repository/movie-repository.dart';
import 'package:dartz/dartz.dart';

class GetMovies {
  final MovieRepository movieRepository ;

  GetMovies(this.movieRepository);
  
  Future<Either<Failure, List<Movie>>> call() async {
    return await movieRepository.getMovies();
  }
}