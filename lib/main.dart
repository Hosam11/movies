import 'package:flutter/material.dart';
import 'package:moviesapi/screens/movie_details_page.dart';
import 'package:moviesapi/screens/movie_page_list.dart';

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
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the MoviePageList widget.
      '/': (context) => MoviePageList(),
      // When navigating to the "/second" route, build the MovieDetailsPage widget.
      '/movieDetailsPage': (context) => MovieDetailsPage(),
      MovieDetailsPage.routeName: (context) => MovieDetailsPage(),
    },
  ));
}
