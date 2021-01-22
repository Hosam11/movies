import 'package:flutter/material.dart';
import 'package:moviesapi/providers/movie_details_provider.dart';
import 'package:provider/provider.dart';

class MovieGenreList extends StatelessWidget {
  final int id;

  MovieGenreList({this.id});

  @override
  Widget build(BuildContext context) {
    print('id >>  $id');

    return ChangeNotifierProvider<MovieDetailsProvider>(
      create: (context) => MovieDetailsProvider(id),
      child: GenreBody(),
    );
  }
}

class GenreBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieDetailsProvider>(builder: (
      BuildContext context,
      MovieDetailsProvider movieDetails,
      Widget child,
    ) {
      return (movieDetails.movieDetails.genres != null)
          ? listGenre(movieDetails)
          : Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
    });
  }

  Widget listGenre(MovieDetailsProvider movieDetails) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieDetails.movieDetails.genres.length,
        itemBuilder: (BuildContext _context, int i) {
          return buildRowGenre(i, movieDetails);
        });
  }

  Widget buildRowGenre(i, MovieDetailsProvider movieDetails) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(movieDetails.movieDetails.genres[i].name,
            style: TextStyle(
                color: Colors.blue[500], fontWeight: FontWeight.w400)),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
