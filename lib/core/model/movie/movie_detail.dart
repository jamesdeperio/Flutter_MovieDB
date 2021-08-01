import 'package:flutter_moviedbapp/core/model/cast/cast.dart';
import 'package:json_annotation/json_annotation.dart';

import 'movie_image.dart';

part 'movie_detail.g.dart';

@JsonSerializable()
class MovieDetail {
  final int id;
  final String? title;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final int budget;
  final String? homePage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? overview;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  final int runtime;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  @JsonKey(ignore: true)
  late String trailerId;

  @JsonKey(ignore: true)
  late MovieImage movieImage;

  @JsonKey(ignore: true)
  late List<Cast> castList;

  MovieDetail(
      this.id,
      this.title,
      this.backdropPath,
      this.budget,
      this.homePage,
      this.originalTitle,
      this.overview,
      this.releaseDate,
      this.runtime,
      this.voteAverage,
      this.voteCount);

  factory MovieDetail.fromJson(Map<String, dynamic> json) => _$MovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}