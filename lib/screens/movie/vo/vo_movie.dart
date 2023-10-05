import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_movie.freezed.dart';
part 'vo_movie.g.dart';

@freezed
class MovieModel with _$MovieModel {
  static const String baseImgUrl = "https://image.tmdb.org/t/p/w500";

  const factory MovieModel({
    required String title,
    required String thumb,
    required String id,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        title: json['title'] as String,
        thumb: "${MovieModel.baseImgUrl}${json['backdrop_path'] ?? ''}",
        id: json['id'].toString(),
      );
}
