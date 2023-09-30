import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_hub/screens/movie/vo/vo_movie.dart';

import '../screens/movie/vo/movie_type.dart';
import '../screens/movie_detail/vo/vo_movie_detail.dart';

class MovieApiService {
  static const String baseMovieUrl =
      "https://movies-api.nomadcoders.workers.dev";

  static Future<List<MovieModel>> getMovies(MovieType movieType) async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseMovieUrl/${movieType.urlPath}');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> movies = responseData['results'];
      for (var movie in movies) {
        final movieInstance = MovieModel.fromJson(movie);
        movieInstances.add(movieInstance);
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getMovieDetail(String movieID) async {
    MovieDetailModel movieDetailInstance;
    final url = Uri.parse('$baseMovieUrl/movie?id=$movieID');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> movieDetail = jsonDecode(response.body);
      final movieDetailInstance = MovieDetailModel.fromJson(movieDetail);

      return movieDetailInstance;
    }
    throw Error();
  }
}
