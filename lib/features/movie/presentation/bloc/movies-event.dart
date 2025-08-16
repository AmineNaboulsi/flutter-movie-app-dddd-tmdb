abstract class MoviesEvent {}

//Filter movie by 
class Filter {
  final String title;
  Filter(
    {
      required this.title
    }
  );
}

//getmovies for movie by filter
class GetMoviesEvent extends MoviesEvent {
}

//Searching for movie by filter
class SearchingForMovie extends MoviesEvent {
  final Filter filter ;
  SearchingForMovie({
    required this.filter
  });
}