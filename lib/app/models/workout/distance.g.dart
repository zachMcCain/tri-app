// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Distance _$DistanceFromJson(Map<String, dynamic> json) => Distance()
  ..$type = json['__type'] as String?
  ..units = $enumDecode(_$DistanceUnitEnumMap, json['units'])
  ..distance = (json['distance'] as num).toDouble()
  ..pace = json['pace'] == null
      ? null
      : Pace.fromJson(json['pace'] as Map<String, dynamic>)
  ..paceMode = $enumDecode(_$PaceModeEnumMap, json['paceMode']);

Map<String, dynamic> _$DistanceToJson(Distance instance) => <String, dynamic>{
      '__type': instance.$type,
      'units': _$DistanceUnitEnumMap[instance.units]!,
      'distance': instance.distance,
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
