import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapi/arguments/movie_argument.dart';
import 'package:moviesapi/providers/movie_details_provider.dart';
import 'package:moviesapi/widgets/movie_details_body.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const routeName = '/Movie_details_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Movie details'),
      ),
      body: MovieLDetails(),
    );
  }
}

class MovieLDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MovieArgument args = ModalRoute.of(context).settings.arguments;

    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: args.posterName,
                  child: Image.network(
                    ('http://image.tmdb.org/t/p/w500' + args.posterName),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            ChangeNotifierProvider<MovieDetailsProvider>(
              create: (context) => MovieDetailsProvider(args.movieId),
              child: MovieDetailsBody(),
            )
          ],
        ),
      ),
    );
  }
}
