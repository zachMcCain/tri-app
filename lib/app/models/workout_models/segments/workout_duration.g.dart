// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_duration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutDuration _$WorkoutDurationFromJson(Map<String, dynamic> json) =>
    WorkoutDuration()
      ..$type = json['__type'] as String?
      ..duration = Duration(microseconds: (json['duration'] as num).toInt())
      ..units = $enumDecode(_$DistanceUnitEnumMap, json['units'])
      ..pace = json['pace'] == null
          ? null
          : Pace.fromJson(json['pace'] as Map<String, dynamic>)
      ..paceMode = $enumDecode(_$PaceModeEnumMap, json['paceMode']);

Map<String, dynamic> _$WorkoutDurationToJson(WorkoutDuration instance) =>
    <String, dynamic>{
      '__type': instance.$type,
      'duration': instance.duration.inMicroseconds,
      'units': _$DistanceUnitEnumMap[instance.units]!,
      'pace': instance.pace?.toJson(),
      'paceMode': _$PaceModeEnumMap[instance.paceMode]!,
    };

const _$DistanceUnitEnumMap = {
  DistanceUnit.mi: 'mi',
  DistanceUnit.km: 'km',
  DistanceUnit.m: 'm',
  DistanceUnit.yd: 'yd',
  DistanceUnit.ft: 'ft',
};

const _$PaceModeEnumMap = {
  PaceMode.mph: 'mph',
  PaceMode.mpm: 'mpm',
  PaceMode.meters: 'meters',
};
