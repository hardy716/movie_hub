import 'package:flutter/material.dart';
import '../../common/common.dart';
import 'vo/movie_type.dart';
import 'vo/vo_movie.dart';
import 'dto/movie_api_service.dart';
import 'w_movie_card.dart';

class MovieScreen extends StatelessWidget {
  MovieScreen({super.key});

  final Future<List<MovieModel>> popularMovies =
      MovieApiService.getMovies(MovieType.popular);
  final Future<List<MovieModel>> nowPlayingMovies =
      MovieApiService.getMovies(MovieType.nowPlaying);
  final Future<List<MovieModel>> comingSoonMovies =
      MovieApiService.getMovies(MovieType.comingSoon);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(
              height: 80.0,
            ),
            MovieCard(
              movies: popularMovies,
              movieType: MovieType.popular,
              title: 'Popular Movies',
            ),
            MovieCard(
              movies: nowPlayingMovies,
              movieType: MovieType.nowPlaying,
              title: 'Now in Cinemas',
            ),
            MovieCard(
              movies: comingSoonMovies,
              movieType: MovieType.comingSoon,
              title: 'Coming Soon',
            ),
          ],
        ).pLTRB(20.0, 0.0, 0.0, 20.0),
      ),
    );
  }
}
