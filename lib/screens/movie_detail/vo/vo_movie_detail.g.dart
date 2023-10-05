// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieDetailModelImpl _$$MovieDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MovieDetailModelImpl(
      title: json['title'] as String,
      thumb: json['thumb'] as String,
      status: json['status'] as String,
      about: json['about'] as String,
      pageUrl: json['pageUrl'] as String,
      runtime: json['runtime'] as int,
      rating: (json['rating'] as num).toDouble(),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$MovieDetailModelImplToJson(
        _$MovieDetailModelImpl instance) =>
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
