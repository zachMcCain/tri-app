// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pace _$PaceFromJson(Map<String, dynamic> json) => Pace()
  ..$type = json['__type'] as String?
  ..distance = (json['distance'] as num).toDouble()
  ..time = Duration(microseconds: (json['time'] as num).toInt())
  ..unit = $enumDecode(_$DistanceUnitEnumMap, json['unit']);

Map<String, dynamic> _$PaceToJson(Pace instance) => <String, dynamic>{
      '__type': instance.$type,
      'distance': instance.distance,
      'time': instance.time.inMicroseconds,
      'unit': _$DistanceUnitEnumMap[instance.unit]!,
    };

const _$DistanceUnitEnumMap = {
  DistanceUnit.mi: 'mi',
  DistanceUnit.km: 'km',
  DistanceUnit.m: 'm',
  DistanceUnit.yd: 'yd',
  DistanceUnit.ft: 'ft',
};
