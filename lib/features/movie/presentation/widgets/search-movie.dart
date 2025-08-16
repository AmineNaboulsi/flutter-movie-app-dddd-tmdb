import 'package:app/features/movie/presentation/bloc/movie-blac.dart';
import 'package:app/features/movie/presentation/bloc/movies-event.dart';
import 'package:app/features/movie/presentation/bloc/movies-satate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchMovie extends StatefulWidget {
  @override
  State<SearchMovie> createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie>

{
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, PageMovieState>(
      builder: (context, state) {
        final isSearching = state is SearchLoadingState;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search movies...",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                onSubmitted: (value) {
                  final filter = Filter(title: value);
                  context.read<MoviesBloc>().add(SearchingForMovie(filter: filter));
                },
              ),
              if (isSearching)
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
            ],
          ),
        );
      },
    );
    
  }
  
 }