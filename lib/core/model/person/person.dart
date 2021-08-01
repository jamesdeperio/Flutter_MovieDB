import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  final int id;
  final int gender;
  final String? name;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @JsonKey(name: 'know_for_department')
  final String? knowForDepartment;
  final double popularity;

  Person(this.id, this.gender, this.name, this.profilePath,
      this.knowForDepartment, this.popularity);

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
