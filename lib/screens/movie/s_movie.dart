import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../common/common.dart';
import 'vo/movie_type.dart';
import 'vo/vo_movie.dart';
import '../../services/movie_api_service.dart';
import 'w_movie_card.dart';

class MovieScreen extends StatelessWidget {
  final MovieApiService movieApiService;

  MovieScreen({super.key}) : movieApiService = MovieApiService(Dio());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(
              height: AppDimensions.topSpacing,
            ),
            buildMovieCard('popular', MovieType.popular, 'Popular Movies'),
            buildMovieCard(
                'nowPlaying', MovieType.nowPlaying, 'Now in Cinemas'),
            buildMovieCard('comingSoon', MovieType.comingSoon, 'Coming Soon'),
          ],
        ).pLTRB(20.0, 0.0, 0.0, 20.0),
      ),
    );
  }

  Widget buildMovieCard(
      String movieCategory, MovieType movieType, String title) {
    return FutureBuilder<List<MovieModel>>(
      future: movieApiService.getMovies(movieType),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show loading indicator while waiting
        } else if (snapshot.hasError) {
          return Text(
              'Error: ${snapshot.error}'); // Show error message if there's an error
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text(
              'No movies found'); // Show message if no movies are found
        } else {
          return MovieCard(
            movies: snapshot.data!,
            movieType: movieType,
            title: title,
          ); // Render MovieCard with the fetched movies
        }
      },
    );
  }
}
