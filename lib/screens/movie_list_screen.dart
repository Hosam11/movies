import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapi/widgets/single_movie_row.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class MovieListScreen extends StatelessWidget {
  static const id = 'movie_list_screen';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('List Of Movies'),
      ),
      body: ChangeNotifierProvider<MoviesProvider>(
        create: (context) => MoviesProvider(),
        child: Consumer<MoviesProvider>(builder: (
          BuildContext context,
          MoviesProvider moviesProvider,
          Widget child,
        ) {
          return (moviesProvider.movie.results != null
              ? MovieListView()
              : Center(child: CircularProgressIndicator()));
        }),
      ),
    );
  }
}

class MovieListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(
        'length movies >>  ${Provider.of<MoviesProvider>(context).movie.results.length} ');
    print('from buildList');
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount:
                  Provider.of<MoviesProvider>(context).movie.results.length,
              itemBuilder: (BuildContext _context, int i) {
                return SingleMovieRow(
                    result:
                        Provider.of<MoviesProvider>(context).movie.results[i]);
              }),
        )
      ],
    );
  }
}
