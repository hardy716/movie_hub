import 'package:json_annotation/json_annotation.dart';

part 'vo_movie_detail.g.dart';

@JsonSerializable()
class MovieDetailModel {
  static const String baseImgUrl = "https://image.tmdb.org/t/p/w500";
  final String title, thumb, status, about, pageUrl;
  final int runtime;
  final double rating;
  final List<String> genres;

  MovieDetailModel({
    required this.title,
    required this.thumb,
    required this.status,
    required this.about,
    required this.pageUrl,
    required this.runtime,
    required this.rating,
    required this.genres,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailModelToJson(this);
}
