import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_hub/screens/movie/vo/vo_movie.dart';

import '../vo/movie_type.dart';

class MovieApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String detail = "movie?id";

  static Future<List<MovieModel>> getMovies(MovieType movieType) async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/${movieType.urlPath}');
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
}
