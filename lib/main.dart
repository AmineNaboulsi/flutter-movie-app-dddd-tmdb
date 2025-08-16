import 'dart:io';
import 'package:app/application/app.dart';
import 'package:app/application/routes.dart';
import 'package:app/features/movie/data/datasource/movie-datasource.dart';
import 'package:app/features/movie/data/repository/movies-repository-impl.dart';
import 'package:app/features/movie/domain/usecase/get_movies.dart';
import 'package:app/features/movie/domain/usecase/search_movies.dart';
import 'package:app/features/movie/presentation/bloc/movie-blac.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final HttpClient client = new HttpClient();
    final MovieDatasourceImpl movieDatasourceImpl = MovieDatasourceImpl(client);
    final MoviesRepositoryImpl moviesRepositoryImpl = MoviesRepositoryImpl(movieDatasourceImpl);
    
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (context) => MoviesBloc(
        GetMovies(moviesRepositoryImpl),
        SearchMovies(moviesRepositoryImpl),
      ),)
      ],
      child: MaterialApp(
      title: 'App',
      theme: ThemeData(
      ),  
      home: App(),
      routes: Routes.routes
      ) ,
    );
  }
}