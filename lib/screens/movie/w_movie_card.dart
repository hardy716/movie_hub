import 'package:flutter/material.dart';
import 'package:movie_hub/common/common.dart';
import 'vo/movie_type.dart';
import 'vo/vo_movie.dart';
import '../../widgets/w_movie_widget.dart';

class MovieCard extends StatelessWidget {
  final Future<List<MovieModel>> movies;
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
    return FutureBuilder(
      future: movies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: AppDimensions.cardHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title.text
                    .size(context.textTheme.displayMedium!.fontSize)
                    .bold
                    .make(),
                const SizedBox(height: AppDimensions.itemSpacing),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var movie = snapshot.data![index];
                      return Column(
                        children: [
                          Movie(
                            title: movie.title,
                            thumb: movie.thumb,
                            id: movie.id,
                            isTitle:
                                (movieType == MovieType.popular) ? false : true,
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: AppDimensions.itemSpacing),
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
