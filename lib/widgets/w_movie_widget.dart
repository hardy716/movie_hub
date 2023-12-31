import 'package:flutter/material.dart';
import 'package:movie_hub/common/common.dart';
import '../screens/movie_detail/s_movie_detail.dart';

class Movie extends StatelessWidget {
  final String title, thumb, id;
  final bool isTitle;

  const Movie({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
    required this.isTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(id: id),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: id,
            child: SizedBox(
              width: (isTitle == true)
                  ? AppDimensions.smallBoxSize
                  : AppDimensions.mediumBoxSize,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  thumb,
                  height: (isTitle == true)
                      ? AppDimensions.smallImgSize
                      : AppDimensions.mediumImgSize,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if (isTitle == true)
            title.text
                .size(context.textTheme.labelMedium!.fontSize)
                .bold
                .make()
                .pSymmetric(v: 10.0),
        ],
      ),
    );
  }
}
