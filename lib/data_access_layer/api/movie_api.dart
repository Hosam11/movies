import 'package:moviesapi/data_access_layer/model/movie.dart';
import 'package:moviesapi/data_access_layer/model/movie_details.dart';
import '../network_client.dart';

class MovieApi {
  Future<Movie> fetchMovies() async {
    print('MovieApi >> fetchMovies()');

    final url =
        'https://api.themoviedb.org/4/discover/movie?api_key=6557d01ac95a807a036e5e9e325bb3f0&sort_by=popularity.desc';

    var jsonRes = await HttpClient().getMoviesByUrl(url);

    var movie = Movie.fromJson(jsonRes);

    print('can not reach that line ');
    return movie;
  }

  Future<MovieDetails> fetchMovieDetails(id) async {
    print('MovieDetailsApi >> fetchMovieDetails()');

    var url = "https://api.themoviedb.org/3/movie/" +
        id.toString() +
        "?api_key=6557d01ac95a807a036e5e9e325bb3f0&language=en-US";
    print('compelet id >> $url');

    var jsonRes = await HttpClient().getMoviesByUrl(url);

    var movieDetails = MovieDetails.fromJson(jsonRes);

    return movieDetails;
  }
}
