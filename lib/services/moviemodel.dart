import 'networking.dart';

const String apiKey = 'd79cb85d';

class MovieModel {
  Future<dynamic> getMovieDetails(String movieName, String movieYear) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://www.omdbapi.com/?t=$movieName&y=$movieYear&apikey=$apiKey');
    var movieData = await networkHelper.getData();
    return movieData;
  }

  Future<dynamic> getMovieDetailsByName(String movieName) async {
    int movieYear = DateTime.now().year;
    NetworkHelper networkHelper = NetworkHelper(
        'https://www.omdbapi.com/?t=$movieName&y=$movieYear&apikey=$apiKey');
    var movieData = await networkHelper.getData();
    return movieData;
  }
}
