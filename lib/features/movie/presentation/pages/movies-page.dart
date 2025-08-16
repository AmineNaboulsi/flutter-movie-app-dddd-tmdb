import 'package:app/features/movie/presentation/bloc/movie-blac.dart';
import 'package:app/features/movie/presentation/bloc/movies-event.dart';
import 'package:app/features/movie/presentation/bloc/movies-satate.dart';
import 'package:app/features/movie/presentation/widgets/movie-item.dart';
import 'package:app/features/movie/presentation/widgets/search-movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movies Page"), elevation: 0),
      body: Column(
        children: [
          SearchMovie(),
          Expanded(
            child: BlocBuilder<MoviesBloc, PageMovieState>(
              builder: (context, state) {
                List movies = [];

                if (state is SuccessLoadedMovieState) {
                  movies = state.movies;
                } else if (state is SearchLoadingState) {
                  movies = state.previousMovies;
                } else if (state is LoadingAllMovieState) {
                  return Center(child: CircularProgressIndicator());
                }

                if (movies.isEmpty) {
                  return Center(child: Text("No movies yet"));
                }

                return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) => MovieItem(movies[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
