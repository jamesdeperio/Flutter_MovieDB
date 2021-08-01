// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(
    json['id'] as int,
    json['gender'] as int,
    json['name'] as String?,
    json['profile_path'] as String?,
    json['know_for_department'] as String?,
    (json['popularity'] as num).toDouble(),
  );
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'gender': instance.gender,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'know_for_department': instance.knowForDepartment,
      'popularity': instance.popularity,
    };
