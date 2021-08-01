import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_image.g.dart';

@JsonSerializable()
class MovieImage extends Equatable {
  final List<Screenshot> backdrops;
  final List<Screenshot> posters;


  MovieImage(this.backdrops, this.posters);

  factory MovieImage.fromJson(Map<String, dynamic> json) => _$MovieImageFromJson(json);

  Map<String, dynamic> toJson() => _$MovieImageToJson(this);

  @override
  List<Object> get props => [backdrops, posters];
}

@JsonSerializable()
class Screenshot extends Equatable {
  @JsonKey(name: 'aspect_ratio')
  final double aspect;
  @JsonKey(name: 'file_path')
  final String imagePath;
  final int height;
  final int width;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;


  Screenshot(this.aspect, this.imagePath, this.height, this.width,
       this.voteAverage, this.voteCount);


  factory Screenshot.fromJson(Map<String, dynamic> json) => _$ScreenshotFromJson(json);

  Map<String, dynamic> toJson() => _$ScreenshotToJson(this);

  @override
  List<Object> get props =>
      [aspect, imagePath, height, width, voteAverage, voteCount];
}