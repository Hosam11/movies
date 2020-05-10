import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapi/arguments/movie_argument.dart';
import 'package:moviesapi/providers/movie_details.dart';
import 'package:provider/provider.dart';

import 'movie_page_list.dart';

class MovieDetailsPage extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('List Of Movies'),
      ),
      body: MovieLDetails(),
    );
  }
}

class MovieLDetails extends StatefulWidget {
  @override
  _MovieLDetailsState createState() => _MovieLDetailsState();
}

class _MovieLDetailsState extends State<MovieLDetails> {
  @override
  Widget build(BuildContext context) {
    final MovieArgument args = ModalRoute.of(context).settings.arguments;

    return Container(
        child: new SingleChildScrollView(
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
          SizedBox(
            height: 8,
          ),
          ChangeNotifierProvider<MovieDetailsProvider>(
            create: (context) => MovieDetailsProvider(args.movieId),
            child: MovieDetailsBody(),
          )
        ],
      ),
    ));
  }
}

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

class AnimateIcon extends StatefulWidget {
  @override
  _AnimateIconState createState() => _AnimateIconState();
}

class _AnimateIconState extends State<AnimateIcon> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Descrption',
            style: TextStyle(
              fontSize: 20,
            )),
        GestureDetector(
          onTap: () {
            setState(() {
              print('pressed');
              clicked = !clicked;
            });
          },
          child: AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: Duration(seconds: 2),
              width: clicked ? 100.0 : 50.0,
              height: clicked ? 100.0 : 50.0,
              alignment:
                  clicked ? Alignment.center : AlignmentDirectional.topCenter,
              child: Icon(
                clicked ? Icons.favorite : Icons.favorite_border,
                size: clicked ? 50.0 : 30.0,
                color: Colors.red,
              )),
        ),
      ],
    );
  }
}
