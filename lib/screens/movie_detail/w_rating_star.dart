import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../common/common.dart';
import 'vo/vo_movie_detail.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({
    super.key,
    required this.movieInfo,
  });

  final MovieDetailModel movieInfo;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: movieInfo.rating / 2,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 24,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: AppColors.yellow,
      ),
      unratedColor: Colors.grey,
      onRatingUpdate: (double value) {},
    );
  }
}
