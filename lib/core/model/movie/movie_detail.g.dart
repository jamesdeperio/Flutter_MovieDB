// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) {
  return MovieDetail(
    json['id'] as int,
    json['title'] as String?,
    json['backdrop_path'] as String?,
    json['budget'] as int,
    json['homePage'] as String?,
    json['original_title'] as String?,
    json['overview'] as String?,
    json['release_date'] as String?,
    json['runtime'] as int,
    (json['vote_average'] as num).toDouble(),
    json['vote_count'] as int,
  );
}

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'budget': instance.budget,
      'homePage': instance.homePage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'runtime': instance.runtime,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
