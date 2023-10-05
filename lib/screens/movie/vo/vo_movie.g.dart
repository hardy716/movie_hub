// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      title: (json['title'] ?? '') as String,
      thumb: "${MovieModel.baseImgUrl}${json['backdrop_path'] ?? ''}",
      id: json['id'].toString(),
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'thumb': instance.thumb,
      'id': instance.id,
    };
