import 'package:app/features/movie/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  
  final Movie movie;

  MovieItem(this.movie);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            // Movie Poster
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: movie.posterPath.isNotEmpty
                  ? Image.network(
                      "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                      width: 100,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 100,
                      height: double.infinity,
                      color: Colors.grey[300],
                      child: Icon(Icons.movie, size: 50, color: Colors.grey[700]),
                    ),
            ),
            SizedBox(width: 12),

            // Movie info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Release: ${movie.releaseDate.isNotEmpty ? movie.releaseDate : "Unknown"}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: Text(
                      movie.overview.isNotEmpty ? movie.overview : "No description",
                      style: TextStyle(fontSize: 13),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        movie.voteAverage.toString(),
                        style: TextStyle(fontSize: 12),
                      ),
                      Spacer(),
                      Text(
                        "${movie.voteCount} votes",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}