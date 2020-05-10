import 'package:moviesapi/data_access_layer/api/movie_api.dart';
import 'package:moviesapi/data_access_layer/model/movie.dart';
import 'package:moviesapi/data_access_layer/model/movie_details.dart';

class MovieRepo {
  Future<Movie> movies() async => await MovieApi().fetchMovies();

  Future<MovieDetails> moviesDetails(id) async =>
      await MovieApi().fetchMovieDetails(id);
}
