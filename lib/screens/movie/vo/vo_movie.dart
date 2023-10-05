import 'package:json_annotation/json_annotation.dart';

part 'vo_movie.g.dart';

@JsonSerializable()
class MovieModel {
  static const String baseImgUrl = "https://image.tmdb.org/t/p/w500";
  final String title, thumb, id;

  MovieModel({required this.title, required this.thumb, required this.id});

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
