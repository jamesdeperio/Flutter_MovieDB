// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieImage _$MovieImageFromJson(Map<String, dynamic> json) {
  return MovieImage(
    (json['backdrops'] as List<dynamic>)
        .map((e) => Screenshot.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['posters'] as List<dynamic>)
        .map((e) => Screenshot.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MovieImageToJson(MovieImage instance) =>
    <String, dynamic>{
      'backdrops': instance.backdrops,
      'posters': instance.posters,
    };

Screenshot _$ScreenshotFromJson(Map<String, dynamic> json) {
  return Screenshot(
    (json['aspect_ratio'] as num).toDouble(),
    json['file_path'] as String,
    json['height'] as int,
    json['width'] as int,
    (json['vote_average'] as num).toDouble(),
    json['vote_count'] as int,
  );
}

Map<String, dynamic> _$ScreenshotToJson(Screenshot instance) =>
    <String, dynamic>{
      'aspect_ratio': instance.aspect,
      'file_path': instance.imagePath,
      'height': instance.height,
      'width': instance.width,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
