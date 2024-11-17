// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Custom _$CustomFromJson(Map<String, dynamic> json) => Custom()
  ..$type = json['__type'] as String?
  ..workoutNotes = json['workoutNotes'] as String?
  ..type = $enumDecode(_$WorkoutTypeEnumMap, json['type'])
  ..segments = (json['segments'] as List<dynamic>)
      .map((e) => AbstractSegment.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CustomToJson(Custom instance) => <String, dynamic>{
      '__type': instance.$type,
      'workoutNotes': instance.workoutNotes,
      'type': _$WorkoutTypeEnumMap[instance.type]!,
      'segments': instance.segments.map((e) => e.toJson()).toList(),
    };

const _$WorkoutTypeEnumMap = {
  WorkoutType.swim: 'swim',
  WorkoutType.bike: 'bike',
  WorkoutType.run: 'run',
  WorkoutType.brick: 'brick',
  WorkoutType.strength: 'strength',
  WorkoutType.custom: 'custom',
};
