import 'package:flutter/cupertino.dart';
import 'package:moviesapi/data_access_layer/model/movie.dart';
import 'package:moviesapi/data_access_layer/repository/movie_repo.dart';

class Movies extends ChangeNotifier {
  Movie movie = Movie();

  Movies() {
    fetchMovies();
  }

  void fetchMovies() async {
    movie = await MovieRepo().movies();
    notifyListeners();
  }
}
