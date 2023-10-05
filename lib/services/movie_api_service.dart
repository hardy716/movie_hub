import 'package:flutter/cupertino.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../screens/movie/vo/movie_type.dart';
import '../screens/movie/vo/vo_movie.dart';
import '../screens/movie_detail/vo/vo_movie_detail.dart';

part 'movie_api_service.g.dart';

@RestApi(baseUrl: "https://movies-api.nomadcoders.workers.dev")
abstract class MovieApiService {
  factory MovieApiService(Dio dio, {String baseUrl}) = _MovieApiService;

  @GET("/{movieType}")
  Future<List<MovieModel>> getMovies(@Path() MovieType movieType);

  @GET("/movie")
  Future<MovieDetailModel> getMovieDetail(@Query("id") String movieID);
}
