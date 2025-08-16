  import 'dart:io';
  import 'dart:convert';
  import 'package:app/core/error/server-exception.dart';
  import 'package:app/features/movie/domain/entities/movie.dart';
  import 'package:app/features/movie/presentation/bloc/movies-event.dart';
  import 'package:dartz/dartz.dart';

  abstract class MovieDatasource {
    Future<Either<Failure ,List<Movie>>> getMovies();
    Future<Either<Failure ,List<Movie>>> searchMovie(Filter f);
  }

  class MovieDatasourceImpl extends MovieDatasource {

    final HttpClient _client ;

    MovieDatasourceImpl(this._client);
    @override
    Future<Either<Failure, List<Movie>>> getMovies() async {
      final request = await _client.get("api.themoviedb.org", 80, "/3/search/movie?api_key=7e8de5b193d8f17ea8828f1e751e0203&query=movie");
      final response = await request.close();
      final stringData = await response.transform(utf8.decoder).join();
      final jsonData = jsonDecode(stringData);
      print("WORKs");
      if (jsonData['results'] != null && jsonData['results'] is List) {
        final List<Movie> movies =  (jsonData['results'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList();
        print(movies);
        return Right(movies);
      }
      throw Left(Exception("Failed to fetch movies"));
    }
    
    @override
    Future<Either<Failure ,List<Movie>>> searchMovie(Filter f) async {
      final request = await _client.get("api.themoviedb.org", 80, "/3/search/movie?api_key=7e8de5b193d8f17ea8828f1e751e0203&query=${f.title}");
      final response = await request.close();
      final stringData = await response.transform(utf8.decoder).join();
      final jsonData = jsonDecode(stringData);
      
      if (jsonData['results'] != null && jsonData['results'] is List) {
        final List<Movie> movies =  (jsonData['results'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList();
        return Right(movies);
      }
      throw Left(Exception("Failed to fetch movies"));
    }
  }