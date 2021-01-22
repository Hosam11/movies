import 'package:flutter/material.dart';
import 'package:moviesapi/arguments/movie_argument.dart';
import 'package:moviesapi/data_access_layer/model/movie.dart';
import 'package:moviesapi/screens/movie_details_screen.dart';
import 'package:moviesapi/widgets/movie_details_row.dart';

class SingleMovieRow extends StatelessWidget {
  final Result result;

  SingleMovieRow({this.result});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Hero(
                  tag: result.posterPath,
                  child: Image.network(
                    ('http://image.tmdb.org/t/p/w500' + result.posterPath),
                    width: 100,
                    height: 120,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: MovieDetailsRow(result: result),
            ),
          ],
        ),
      ),
      onTap: () {
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, MovieDetailsScreen.routeName,
            arguments: MovieArgument(result.posterPath, result.id.toString()));
      },
    );
  }
}
