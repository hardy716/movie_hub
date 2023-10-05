// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailModel _$MovieDetailModelFromJson(Map<String, dynamic> json) =>
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

Map<String, dynamic> _$MovieDetailModelToJson(MovieDetailModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'thumb': instance.thumb,
      'status': instance.status,
      'about': instance.about,
      'pageUrl': instance.pageUrl,
      'runtime': instance.runtime,
      'rating': instance.rating,
      'genres': instance.genres,
    };
