import 'package:flutter/cupertino.dart';
import 'package:moviesapi/data_access_layer/model/movie_details.dart';
import 'package:moviesapi/data_access_layer/repository/movie_repo.dart';

class MovieDetailsProvider extends ChangeNotifier {
  MovieDetails movieDetails = MovieDetails();

  MovieDetailsProvider(id) {
    fetchMovieDetails(id);
  }

  void fetchMovieDetails(id) async {
    movieDetails = await MovieRepo().moviesDetails(id);
    notifyListeners();
  }
}
