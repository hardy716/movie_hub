import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_movie_detail.freezed.dart';
part 'vo_movie_detail.g.dart';

@freezed
class MovieDetailModel with _$MovieDetailModel {
  static const String baseImgUrl = "https://image.tmdb.org/t/p/w500";

  const factory MovieDetailModel({
    required String title,
    required String thumb,
    required String status,
    required String about,
    required String pageUrl,
    required int runtime,
    required double rating,
    required List<String> genres,
  }) = _MovieDetailModel;

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
        title: (json['title'] ?? '') as String,
        thumb: "${MovieDetailModel.baseImgUrl}${json['poster_path'] ?? ''}",
        status: (json['status'] ?? '') as String,
        about: (json['overview'] ?? '') as String,
        pageUrl: (json['homepage'] ?? '') as String,
        runtime: (json['runtime'] ?? 0) as int,
        rating: (json['vote_average'] ?? 0.0) as double,
        genres: (json['genres'] as List<dynamic>)
            .map((genre) => genre['name'] as String)
            .toList(),
      );
}
