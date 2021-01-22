import 'package:flutter/cupertino.dart';
import 'package:moviesapi/data_access_layer/model/movie.dart';
import 'package:moviesapi/data_access_layer/repository/movie_repo.dart';

class MoviesProvider extends ChangeNotifier {
  Movie movie = Movie();

  MoviesProvider() {
    fetchMovies();
  }

  void fetchMovies() async {
    movie = await MovieRepo().movies();
    notifyListeners();
  }
}
