import 'package:flutter/material.dart';
import 'package:moviesapi/screens/movie_details_screen.dart';
import 'package:moviesapi/screens/movie_list_screen.dart';

//void main() => runApp(MoviePageList());

void main() {
  runApp(MaterialApp(
    title: 'Movies App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    debugShowCheckedModeBanner: false,
    // Start the app with the "/" named route. In this case, the app starts
    // on the MoviePageList widget.
    initialRoute: MovieListScreen.id,
    routes: {
      // When navigating to the "/" route, build the MoviePageList widget.
      MovieListScreen.id: (context) => MovieListScreen(),
      // When navigating to the "/movieDetailsPage" route, build the MovieDetailsPage widget.
      MovieDetailsScreen.routeName: (context) => MovieDetailsScreen(),
    },
  ));
}
