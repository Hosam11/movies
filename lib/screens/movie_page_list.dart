import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapi/arguments/movie_argument.dart';
import 'package:moviesapi/data_access_layer/model/movie.dart';
import 'package:moviesapi/providers/movie_details.dart';
import 'package:provider/provider.dart';

import '../providers/movies.dart';
import 'movie_details_page.dart';

class MoviePageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('List Of Movies'),
      ),
      body: ChangeNotifierProvider<Movies>(
        create: (context) => Movies(),
        child: MoviePageBody(),
      ),
    );
  }
}

class MoviePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Movies>(builder: (
      BuildContext context,
      Movies movies,
      Widget child,
    ) {
      if (Provider.of<Movies>(context).movie.results != null) {
        return MovieListView();
      } else {
        return Center(child: new CircularProgressIndicator());
      }
    });
  }
}

class MovieListView extends StatefulWidget {
  // List<Result> movieList = List<Result>();
  @override
  _MovieListView createState() => _MovieListView();

//  MovieListView();
}

class _MovieListView extends State<MovieListView> {
  @override
  Widget build(BuildContext context) {
    return buildList();
  }

  // building list view
  Widget buildList() {
    print(
        'length movies >>  ${Provider.of<Movies>(context).movie.results.length} ');
    print('from buildList');
    return Column(
      children: <Widget>[
        new Expanded(
          child: ListView.builder(
              itemCount: Provider.of<Movies>(context).movie.results.length,
              itemBuilder: (BuildContext _context, int i) {
                return buildRow(Provider.of<Movies>(context).movie.results[i]);
              }),
        )
      ],
    );
  }

  // the single row for list of movie
  Widget buildRow(Result result) {
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
              child: movieDetailsInSingleListViewRow(result),
            ),
          ],
        ),
      ),
      onTap: () {
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, MovieDetailsPage.routeName,
            arguments: MovieArgument(result.posterPath, result.id.toString()));
      },
    );
  }

  /// result : the current result object in single row that will display
  Widget movieDetailsInSingleListViewRow(Result result) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        // Title Text
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Text(
                result.title,
                style: Theme.of(context).textTheme.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        //TODO genre listView
        Container(
          height: 30,
          // send id to build listview
          child: MovieListGenre(result.id),
        ),
        SizedBox(
          height: 8,
        ),
        // Release Data Text
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              ('Release On ' +
                  result.releaseDate.day.toString() +
                  "/" +
                  result.releaseDate.month.toString() +
                  "/" +
                  result.releaseDate.year.toString()),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        // Overview Text
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Text(
                result.overview,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

class MovieListGenre extends StatefulWidget {
  var id;

  @override
  _MovieListGenreState createState() => _MovieListGenreState();

  MovieListGenre(this.id);
}

class _MovieListGenreState extends State<MovieListGenre> {
  @override
  Widget build(BuildContext context) {
    print('id >>  ${widget.id}');

    return ChangeNotifierProvider<MovieDetailsProvider>(
      create: (context) => MovieDetailsProvider(widget.id),
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
      if (movieDetails.movieDetails.genres != null) {
        return listGenre(movieDetails);
      } else {
        return CircularProgressIndicator(
          backgroundColor: Colors.white,
        );
      }
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
            style: new TextStyle(
                color: Colors.blue[500], fontWeight: FontWeight.w400)),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
