import 'package:flutter/material.dart';
import 'package:movie_hub/common/common.dart';
import 'vo/movie_type.dart';
import 'vo/vo_movie.dart';
import '../../widgets/w_movie_widget.dart';

class MovieCard extends StatelessWidget {
  final List<MovieModel> movies;
  final MovieType movieType;
  final String title;

  const MovieCard({
    super.key,
    required this.movies,
    required this.movieType,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.cardHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title.text
              .size(context.textTheme.displayMedium!.fontSize)
              .bold
              .make(),
          const SizedBox(height: AppDimensions.itemSpacing10),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                var movie = movies[index];
                return Column(
                  children: [
                    Movie(
                      title: movie.title,
                      thumb: movie.thumb,
                      id: movie.id,
                      isTitle: (movieType == MovieType.popular) ? false : true,
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(width: AppDimensions.itemSpacing10),
            ),
          ),
        ],
      ),
    );
  }
}
