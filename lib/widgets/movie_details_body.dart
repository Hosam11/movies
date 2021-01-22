import 'package:flutter/material.dart';
import 'package:moviesapi/providers/movie_details_provider.dart';
import 'package:provider/provider.dart';
import 'animate_icon.dart';
import 'movie_genre_list.dart';

class MovieDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieDetailsProvider>(builder: (
      BuildContext context,
      MovieDetailsProvider movieDetailsProvider,
      Widget child,
    ) {
      if (movieDetailsProvider.movieDetails.genres != null) {
        return buildMovieDetails(movieDetailsProvider);
      } else {
        return CircularProgressIndicator(
          backgroundColor: Colors.white,
        );
      }
    });
  }

  Widget buildMovieDetails(MovieDetailsProvider detailsProvider) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  detailsProvider.movieDetails.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              Text(detailsProvider.movieDetails.voteAverage.toString())
            ],
          ),
          SizedBox(
            height: 8,
          ),
          // list of genre
          Container(
            height: 30,
            // From the MovieListGenre Class in the first Screen
            child: GenreBody().listGenre(detailsProvider),
          ),
          // description title
          AnimateIcon(),
          SizedBox(
            height: 8,
          ),
          //description text
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Text(
                  detailsProvider.movieDetails.overview,
                  maxLines: 5,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.ltr,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
